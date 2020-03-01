begin
  require_relative 'greeter'
rescue ::LoadError
  require './greeter'
end

# ------------------------------------------------------------------------------

actual = begin
  Greeter.new('Alice')
end

raise if actual.salute != "Hello Alice!"

# ------------------------------------------------------------------------------

actual = begin
  Greeter.new('world')
end

raise if actual.salute != "Hello World!"
