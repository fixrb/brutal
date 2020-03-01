# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rubocop/rake_task'

RuboCop::RakeTask.new

Rake::TestTask.new do |t|
  t.pattern = '**/test.rb'
  t.verbose = true
  t.warning = true
end

namespace :test do
  task :coverage do
    ENV['COVERAGE'] = 'true'
    Rake::Task['test'].invoke
  end
end

task :scaffold! do
  print 'Generating brutal test suite... '
  `brutal`
  puts 'Done.'

  Dir.chdir('examples') do
    Dir.entries('.').reject { |name| %w[. ..].include?(name) }.each do |example|
      Dir.chdir(example) do
        print "Generating #{example} test suite... "
        `brutal`
        puts 'Done.'
      end
    end
  end
end

task(:doc_stats) { ruby '-S yard stats' }

task default: %i[scaffold! test doc_stats rubocop]
