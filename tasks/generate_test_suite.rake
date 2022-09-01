# frozen_string_literal: true

desc "Generate test suite"
task :generate_test_suite do
  print "Generating Brutal test suite... "

  `bundle exec brutal`

  puts "Done."
end
