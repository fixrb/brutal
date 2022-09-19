# Brutal test suite

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  "Hello " + "Alice"
end

raise if actual.length != 11
raise if actual.to_s != "Hello Alice"

# Finishing a test

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  "Hello " + "Bob"
end

raise if actual.length != 9
raise if actual.to_s != "Hello Bob"

# Finishing a test

# ------------------------------------------------------------------------------

# End of the brutal test
