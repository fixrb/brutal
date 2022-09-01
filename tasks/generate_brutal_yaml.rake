# frozen_string_literal: true

desc "Generate brutal YAML file"
task :generate_brutal_yaml do
  print "Generating test/brutal/format/ruby_brutal.yaml file... "

  template = File.read("test/brutal/format/ruby_brutal.yaml.erb")
  renderer = ERB.new(template)

  file = ::File.open("test/brutal/format/ruby_brutal.yaml", "w")
  file.write(renderer.result)
  file.close

  puts "Done."
end
