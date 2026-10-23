# frozen_string_literal: true

require "aw"

# Writes plain Ruby test files from YAML manifests. A manifest gives a
# subject, contexts to combine and actuals to observe; brutal runs every
# combination in a child process, records what the code returns, and writes
# a test file that checks these values with `eql?`, without any framework.
#
# The test file describes what the code does, not what it should do: read
# it before trusting it.
#
# @example
#   Brutal.generate("test/calc_brutal.yaml").path # => "test/test_calc.rb"
module Brutal
  # Raised for a manifest brutal cannot turn into a test file: the message
  # says why, without the path of the manifest.
  class Error < ::StandardError
  end

  # A test file to write.
  #
  # @!attribute [r] path
  #   @return [String] where to write it: `test_NAME.rb`, next to the manifest
  # @!attribute [r] source
  #   @return [String] its content
  Test = ::Data.define(:path, :source)

  # Reads a manifest, runs its code in a child process to record the values
  # it returns, and builds the test file. Nothing is written.
  #
  # @param manifest_path [String] the path of a `NAME_brutal.yaml` file
  # @return [Brutal::Test]
  # @raise [Brutal::Error] when the manifest is not valid, the code does not
  #   compile, raises, ends its process or skips a check, a value cannot be
  #   written as a literal, or this Ruby cannot fork
  # @raise [SystemCallError] when the manifest cannot be read
  def self.generate(manifest_path)
    program = Program.new(Manifest.read(manifest_path))
    path = Output.target(manifest_path)
    absolute = ::File.join(::File.realpath(::File.dirname(path)), ::File.basename(path))
    Test.new(path:, source: program.test(literals(program, Runner.record(program.record, absolute))))
  end

  # Writes a test file, once the Ruby that runs brutal has run it, in a new
  # process, and it passed: the code runs a second time. An unchanged file is
  # run too.
  #
  # @param test [Brutal::Test]
  # @return [void]
  # @raise [Brutal::Error] when the test file fails, or cannot replace the file in place
  # @raise [SystemCallError] when the file cannot be written
  def self.write(test)
    Output.write(test.path, test.source) do |temporary|
      error = Runner.run(temporary)
      # The name of the temporary file, which is ASCII, gives way to the test
      # file's: the directory is the same, whatever the encoding of its name.
      error &&= error.gsub(::File.basename(temporary), ::File.basename(test.path))
      raise Error, "the test file fails when ruby runs it: #{error}" if error
    end
  end

  # The literal of each observed value, once the recording ran to its end.
  def self.literals(program, recording)
    phase, snapshots, error = recording
    raise Error, "#{program.phase(phase)}: #{error}" if error
    unless snapshots.size == program.size
      raise Error, "observed values: #{snapshots.size}, expected: #{program.size}; a check was skipped or repeated"
    end

    snapshots.each_with_index.map do |(kind, data), index|
      literal, reason = literal(kind, data)
      raise Error, "#{program.label(index)} #{reason}, which brutal cannot write as a literal" if reason

      literal
    end
  end

  # `[literal, nil]`, or `[nil, reason]` for a value that has no literal.
  def self.literal(kind, data)
    return [nil, data] if kind == :unsupported

    [Literal.dump(data), nil]
  rescue Error => e
    [nil, e.message]
  end

  private_class_method :literals, :literal
end

require_relative "brutal/cli"
require_relative "brutal/literal"
require_relative "brutal/manifest"
require_relative "brutal/output"
require_relative "brutal/program"
require_relative "brutal/runner"
