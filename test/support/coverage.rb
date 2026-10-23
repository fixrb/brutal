# frozen_string_literal: true

require "English"
require "fileutils"
require "simplecov"

SimpleCov.start do
  # Leave the tests out of the report, and the examples' test files, which
  # Ruby 3.4 and later measure when brutal compiles them.
  skip "/test/"
  skip "/examples/"
  enable_coverage :branch
  # Brutal records and replays in children: merge the share of every child.
  merge_subprocesses true
  minimum_coverage line: 100, branch: 100
end

# Start from an empty resultset: SimpleCov merges the results of the last
# ten minutes, and a previous run would cover for a child that stored
# nothing in this one.
FileUtils.rm_f(File.join(SimpleCov.coverage_path, ".resultset.json"))

# An exit that escapes a test, from a child through Aw, would end the suite
# with success: make it a failure.
at_exit { exit(1) if $ERROR_INFO.is_a?(SystemExit) && $ERROR_INFO.success? }

# A child stores its share from an at_exit handler, which the exit! ending
# every child of Aw skips: store it just before. Loaded before Aw, so that
# the exit! Aw captures is this one.
exit_bang = Process.method(:exit!)
Process.singleton_class.prepend(
  Module.new do
    define_method(:exit!) do |status = false|
      SimpleCov.result
    ensure
      exit_bang.call(status)
    end
  end
)
