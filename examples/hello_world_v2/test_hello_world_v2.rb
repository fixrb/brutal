# Brutal test suite

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  "Hello " + "Alice"
end

# Finishing an example

raise if actual.length != 11
raise if actual.to_s != "Hello Alice"

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  "Hello " + "Bob"
end

# Finishing an example

raise if actual.length != 9
raise if actual.to_s != "Hello Bob"

# ------------------------------------------------------------------------------

# End of the brutal test
