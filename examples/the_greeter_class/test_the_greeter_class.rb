begin
  require_relative "greeter"
rescue ::LoadError
  require "./greeter"
end

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  Greeter.new('Alice')
end

raise if actual.salute != "Hello Alice!"

# Finishing a test

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  Greeter.new('world')
end

raise if actual.salute != "Hello World!"

# Finishing a test

# ------------------------------------------------------------------------------

# End of the brutal test
