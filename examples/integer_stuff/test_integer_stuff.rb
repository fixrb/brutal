# Brutal test suite

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  -42.abs
end

raise if actual.to_s != "42"

# Finishing a test

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  -42.-(2)
end

raise if actual.to_s != "-44"

# Finishing a test

# ------------------------------------------------------------------------------

# End of the brutal test
