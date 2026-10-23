# frozen_string_literal: true

require_relative File.join("support", "coverage")
require_relative File.join("..", "lib", "brutal")
require "stringio"

# Each example's test file is the one brutal writes today, on this Ruby:
# generation is deterministic, and the file passes on its code.
manifests = Dir.glob(File.join(__dir__, "..", "examples", "**", "*_brutal.yaml"))
raise unless manifests.size == 8

stdout = $stdout
begin
  $stdout = StringIO.new
  manifests.each do |path|
    test = Brutal.generate(path)
    raise "#{test.path} is not up to date" unless Brutal::Output.current?(test.path, test.source)
  end
ensure
  $stdout = stdout
end
