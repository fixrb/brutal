# frozen_string_literal: true

require "rbconfig"

module Brutal
  # Runs the code of a manifest, in two ways.
  #
  # {record} runs the recording program in a child process forked through
  # Aw, as `ruby` would run the test file: compiled at the top level, with
  # `self` as `main`, the magic comments of the header, `__FILE__`, `$0` and
  # `__dir__` those of the test file, no arguments and nothing on the
  # standard input. What the code does to the process stays in the child,
  # and only data come back.
  #
  # {run} runs a test file with the Ruby that runs brutal, in a new process,
  # as `ruby test_NAME.rb` would.
  #
  # @api private
  module Runner
    CLASS = ::Kernel.instance_method(:class)
    VARIABLE = ::Kernel.instance_method(:instance_variable_get)
    SCALARS = [::NilClass, ::TrueClass, ::FalseClass, ::Integer, ::Float, ::Symbol].freeze
    DEPTH = 100
    CREATE = ::File::RDWR | ::File::CREAT | ::File::EXCL
    LIMIT = 65_536

    private_constant :CLASS, :VARIABLE, :SCALARS, :DEPTH, :CREATE, :LIMIT

    # Raised in the child for a value that cannot leave it as data.
    class Unsupported < ::StandardError
    end

    # What the recording program calls, as `$__brutal__`. Its state is read
    # without calling its methods, which the code may redefine.
    class Recorder
      def initialize
        @phase = nil
        @snapshots = []
      end

      # @param phase [Integer] the index of the example about to run, or of the footer
      # @return [nil]
      def enter(phase)
        @phase = phase
        nil
      end

      # @param value [Object] an observed value
      # @return [nil]
      def observe(value)
        @snapshots << Runner.snapshot(value)
        nil
      end
    end

    # Runs the recording program in a child process.
    #
    # @param source [String]
    # @param path [String] the absolute path of the test file
    # @return [Array((Integer, nil), Array<Array(Symbol, Object)>, (String, nil))] the last phase (nil for the
    #   header), the snapshots, and the error, if any
    # @raise [Brutal::Error] when the source does not compile, or the child ends without a result
    def self.record(source, path)
      program = compile(source, path)
      fork do
        recorder = Recorder.new
        $__brutal__ = recorder # rubocop:disable Style/GlobalVars
        ::ARGV.clear
        $PROGRAM_NAME = path
        $stdin.reopen(::File::NULL)
        error = evaluate(program)
        [VARIABLE.bind_call(recorder, :@phase), VARIABLE.bind_call(recorder, :@snapshots), error]
      end
    end

    # Runs a test file with `RbConfig.ruby`, from the current directory, with nothing
    # on its standard input and its standard output discarded. Its standard
    # error goes to a file created next to it and removed at once: a process
    # the test leaves running cannot keep brutal waiting.
    #
    # @param path [String]
    # @return [String, nil] why it failed, from its standard error, or nil when it passed
    def self.run(path)
      log = ::File.join(::File.dirname(path), ".#{::File.basename(path)}.#{::Process.pid}.err")
      pid = nil
      ::File.open(log, CREATE, 0o600, binmode: true) do |errors|
        ::File.unlink(log)
        pid = ::Process.spawn(::RbConfig.ruby, path, in: ::File::NULL, out: ::File::NULL, err: errors)
        _, status = ::Process.wait2(pid)
        pid = nil
        errors.rewind
        failure(errors.read(LIMIT).to_s, status) unless status.success?
      end
    ensure
      reap(pid)
    end

    # The first line of the standard error that is not a warning, and how
    # the process ended.
    def self.failure(errors, status)
      line = ::String.new(errors, encoding: ::Encoding::UTF_8).scrub.lines.find { |text| !text.include?(": warning: ") }
      "#{line&.chomp || "no message"} (#{status(status)})"
    end

    # Converts an observed value to data made of core classes only.
    #
    # @param value [Object]
    # @return [Array(Symbol, Object)] `[:value, data]` or `[:unsupported, reason]`
    def self.snapshot(value)
      [:value, plain(value, 0)]
    rescue Unsupported => e
      [:unsupported, e.message]
    end

    # Runs a block in a child process.
    def self.fork(&)
      raise Error, "brutal needs fork(2), which this Ruby does not have" unless ::Aw.supported?

      ::Aw.fork!(&)
    rescue ::Aw::ChildError => e
      raise Error, "the process running the code ended without a result (#{status(e.status)})"
    end

    # Compiles the source, in the parent: nothing runs.
    def self.compile(source, path)
      ::RubyVM::InstructionSequence.compile(source, path, path, 1)
    rescue ::SyntaxError => e
      raise Error, "the code does not compile: #{e.message}"
    end

    # Runs the program at the top level; returns what it raised, as text.
    def self.evaluate(program)
      program.eval
      nil
    rescue ::Exception => e # rubocop:disable Lint/RescueException
      describe(e)
    end

    # The class and the message of an exception, built defensively: its
    # methods may raise.
    def self.describe(error)
      name = CLASS.bind_call(error).name || "an anonymous exception"
      message = error.message.to_s.encode(::Encoding::UTF_8, invalid: :replace, undef: :replace)
      "#{name}: #{message}"
    rescue ::Exception # rubocop:disable Lint/RescueException
      "#{name || "an exception"}, whose message cannot be read"
    end

    # A copy of the value made of the classes Literal writes, by their exact
    # class: an instance of a subclass, or of a class the parent does not
    # know, cannot come back.
    def self.plain(value, depth)
      raise Unsupported, "is nested more than #{DEPTH} levels deep, or contains itself" if depth > DEPTH
      raise Unsupported, "is a BasicObject" unless ::Kernel === value # rubocop:disable Style/CaseEquality

      copy(value, CLASS.bind_call(value), depth + 1)
    end

    # A copy of a value of the given class.
    def self.copy(value, klass, depth)
      return value if SCALARS.include?(klass)
      return ::String.new(value) if klass.equal?(::String)
      return value.map { |item| plain(item, depth) } if klass.equal?(::Array)
      return value.to_h { |key, item| [plain(key, depth), plain(item, depth)] } if klass.equal?(::Hash)

      raise Unsupported, "is an instance of #{klass.name || "an anonymous class"}"
    end

    # How a process ended.
    def self.status(status)
      return "killed by SIG#{::Signal.signame(status.termsig)}" if status.signaled?

      "exit status #{status.exitstatus}"
    end

    # Kills and reaps a process left running by an interruption.
    def self.reap(pid)
      return if pid.nil?

      ::Process.kill(:KILL, pid)
      ::Process.wait(pid)
    end

    private_class_method :failure, :fork, :compile, :evaluate, :describe, :plain, :copy, :status, :reap
  end
end
