# frozen_string_literal: true

require "bundler/gem_tasks"
require "erb"
require "rake/testtask"
require "rubocop/rake_task"
require "yard"

require_relative File.join("lib", "brutal", "format", "ruby", "filename")

TEST_FILENAME_PATTERN = "#{Brutal::Format::Ruby::Filename::PREFIX}*#{Brutal::Format::Ruby::Filename::SUFFIX}"

Rake::TestTask.new do |t|
  t.pattern = ::File.join("**", TEST_FILENAME_PATTERN)
  t.verbose = true
  t.warning = true
end

RuboCop::RakeTask.new
YARD::Rake::YardocTask.new

Dir[::File.join("tasks", "**", "*.rake")].each { |t| load t }

task default: %i[
  generate_rubocop_yaml
  generate_brutal_yaml
  generate_test_suite
  yard
  rubocop:autocorrect
  test
]
