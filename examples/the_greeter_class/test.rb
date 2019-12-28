require './greeter'

# ------------------------------------------------------------------------------

front_object = Greeter

# ------------------------------------------------------------------------------

actual = front_object.new('world')

raise unless actual.salute == "Hello World!"
