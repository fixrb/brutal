# frozen_string_literal: true

desc "Generate brutal YAML file"
task :generate_brutal_yml do
  print "Generating brutal.yml file... "

  template = File.read(".brutal.yml.erb")
  renderer = ERB.new(template)

  file = ::File.open(".brutal.yml", "w")
  file.write(renderer.result)
  file.close

  puts "Done."
end
