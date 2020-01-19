begin
  require_relative './greeter'
rescue ::LoadError
  require './greeter'
end

# ------------------------------------------------------------------------------

front_object = Greeter

# ------------------------------------------------------------------------------

actual = front_object.new('world')

raise unless actual.salute == "Hello World!"
