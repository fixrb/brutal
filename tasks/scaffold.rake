# frozen_string_literal: true

desc "Scaffold"
task :scaffold! do
  print "Generating brutal test suite... "

  `bundle exec brutal`
  `chmod +x test.rb`

  puts "Done."

  Dir.chdir("examples") do
    paths = %w[. ..]

    Dir.entries(".").reject { |name| paths.include?(name) }.each do |example|
      Dir.chdir(example) do
        print "Generating #{example} test suite... "

        `bundle exec brutal`
        `chmod +x test.rb`

        puts "Done."
      end
    end
  end
end
