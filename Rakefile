# frozen_string_literal: true

require "bundler/gem_tasks"
require "erb"
require "rake/testtask"
require "rubocop/rake_task"
require "yard"

Rake::TestTask.new do |t|
  t.pattern = "**/*_brutal.rb"
  t.verbose = true
  t.warning = true
end

RuboCop::RakeTask.new
YARD::Rake::YardocTask.new

Dir["tasks/**/*.rake"].each { |t| load t }

task default: %i[
  generate_rubocop_yaml
  generate_brutal_yaml
  generate_test_suite
  yard
  rubocop:autocorrect
  test
]
