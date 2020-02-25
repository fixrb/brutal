begin
  require_relative 'greeter'
rescue ::LoadError
  require './greeter'
end

# ------------------------------------------------------------------------------

actual = begin
  Greeter.new('world')
end

raise unless actual.salute == "Hello World!"
