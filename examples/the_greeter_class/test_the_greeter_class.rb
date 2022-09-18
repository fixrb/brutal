begin
  require_relative "greeter"
rescue ::LoadError
  require "./greeter"
end

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  Greeter.new('Alice')
end

# Finishing an example

raise if actual.salute != "Hello Alice!"

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  Greeter.new('world')
end

# Finishing an example

raise if actual.salute != "Hello World!"

# ------------------------------------------------------------------------------

# End of the brutal test
