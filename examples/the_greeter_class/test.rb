begin
  require_relative 'greeter'
rescue ::LoadError
  require './greeter'
end

# ------------------------------------------------------------------------------

front_object = Greeter

# ------------------------------------------------------------------------------

actual = begin
  front_object.new('world')
end

raise unless actual.salute == "Hello World!"
