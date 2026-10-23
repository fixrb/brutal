# frozen_string_literal: true

require "fileutils"
require "rbconfig"
require "stringio"
require "tmpdir"

# A temporary directory holding the given files, by relative path; removed
# when the test ends.
def project(files)
  directory = Dir.mktmpdir("brutal-test-")
  at_exit { FileUtils.remove_entry(directory) }
  files.each do |name, content|
    path = File.join(directory, name)
    FileUtils.mkdir_p(File.dirname(path))
    File.write(path, content)
  end
  directory
end

# A project holding one manifest, x_brutal.yaml, and other files; returns the
# path of the manifest.
def manifest(yaml, **files)
  File.join(project({ "x_brutal.yaml" => yaml, **files.transform_keys(&:to_s) }), "x_brutal.yaml")
end

# The message of the Brutal::Error raised for the manifest, or nil; any
# other exception that escapes, an exit included, is a failure of the test.
def failure(path)
  Brutal.generate(path)
  nil
rescue Brutal::Error => e
  e.message
rescue Exception => e # rubocop:disable Lint/RescueException
  raise "#{e.class} escaped Brutal.generate: #{e.message}"
end

# Runs a test file with ruby, as a user would: true when it passes.
def passes?(path)
  system(RbConfig.ruby, path, out: File::NULL, err: File::NULL)
end

# Runs the command; returns its status and what it wrote.
def brutal(*arguments)
  out = StringIO.new
  err = StringIO.new
  status = Brutal::CLI.run(arguments, out:, err:)
  [status, out.string, err.string]
end
