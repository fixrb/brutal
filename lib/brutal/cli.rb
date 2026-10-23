# frozen_string_literal: true

module Brutal
  # The `brutal` command.
  module CLI
    # @return [String]
    USAGE = <<~TXT
      Usage: brutal [--check] PATH...

      Writes test_NAME.rb next to each NAME_brutal.yaml given as PATH, or found
      in a directory given as PATH and its subdirectories.

          --check     Run the code, write nothing; fail when a test file is missing or differs.
          --help, -h  Show this help.
    TXT

    OPTIONS = %w[--check --help -h].freeze
    HELP = %w[--help -h].freeze
    private_constant :OPTIONS, :HELP

    # Runs the command. A manifest that fails is reported on `err`, and the
    # others still run.
    #
    # @param arguments [Array<String>] the options and paths
    # @param out [IO] where the help goes
    # @param err [IO] where the errors go
    # @return [Integer] 0 when every manifest succeeded, 1 when one failed or a path
    #   designates no manifest, 2 for a usage error
    def self.run(arguments, out: $stdout, err: $stderr)
      options, paths = arguments.partition { |argument| argument.start_with?("-") }
      problem = problem(options, paths)
      return usage(err, problem) if problem
      return help(out) if options.intersect?(HELP)

      succeeded?(paths, options.include?("--check"), err) ? 0 : 1
    end

    # What is wrong with the arguments, if anything.
    def self.problem(options, paths)
      unknown = options - OPTIONS
      return "unknown option #{unknown.first}" unless unknown.empty?

      "no path given" if paths.empty? && !options.intersect?(HELP)
    end

    # Processes the manifests of every path, each once (a manifest is known
    # by its name and the real path of its directory, as its test file is);
    # true when all succeeded.
    def self.succeeded?(paths, check, err)
      found = paths.map { |path| manifests(path, err) }
      unique = found.compact.flatten.uniq do |path|
        ::File.join(::File.realpath(::File.dirname(path)), ::File.basename(path))
      end
      unique.map { |path| process(path, check, err) }.all? && !found.include?(nil)
    end

    # The manifests a path designates: the path itself, or the manifests in
    # a directory and its subdirectories, in order. Hidden files and
    # directories, and symbolic links to directories, are left out. Nil,
    # after a message, when there is none.
    def self.manifests(path, err)
      return [path] if ::File.file?(path)

      found = ::File.directory?(path) ? search(path) : []
      return found unless found.empty?

      report(err, path, ::File.exist?(path) ? "no manifest found" : "no such file or directory")
      nil
    rescue ::SystemCallError => e
      report(err, path, e.message)
      nil
    end

    # The regular files named `*_brutal.yaml` in a directory and its
    # subdirectories; a directory that cannot be read is an error.
    def self.search(directory)
      ::Dir.children(directory).sort.flat_map do |name|
        path = ::File.join(directory, name)
        if name.start_with?(".") then []
        elsif ::File.directory?(path) then ::File.symlink?(path) ? [] : search(path)
        else name.end_with?(Manifest::SUFFIX) && ::File.file?(path) ? [path] : []
        end
      end
    end

    # Generates the test file of a manifest, then writes it, or compares it
    # with the file in place. A file brutal cannot replace is refused before
    # the code runs.
    def self.process(path, check, err)
      Output.check(Output.target(path))
      return current?(Brutal.generate(path), path, err) if check

      Brutal.write(Brutal.generate(path))
      true
    rescue Error, ::SystemCallError => e
      report(err, path, e.message)
      false
    end

    # Whether the test file in place is the one brutal would write.
    def self.current?(test, path, err)
      return true if Output.current?(test.path, test.source)

      report(err, path, "#{text(test.path)} is #{::File.exist?(test.path) ? "not up to date" : "missing"}")
      false
    end

    # Reports why a path failed, as `brutal: PATH: REASON`.
    def self.report(err, path, reason)
      err.puts("brutal: #{text(path)}: #{text(reason)}")
    end

    # A string relabelled as UTF-8, its bytes unchanged: the file system and
    # the locale name a path in an encoding of their own, in which it could
    # not join the text of a manifest.
    def self.text(string)
      string.dup.force_encoding(::Encoding::UTF_8)
    end

    # Prints the help.
    def self.help(out)
      out.puts(USAGE)
      0
    end

    # Prints a usage error, then the help.
    def self.usage(err, message)
      err.puts("brutal: #{message}", "", USAGE)
      2
    end

    private_class_method :problem, :succeeded?, :manifests, :search, :process, :current?, :report, :text, :help, :usage
  end
end
