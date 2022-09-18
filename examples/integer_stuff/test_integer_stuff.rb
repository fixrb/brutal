# Brutal test suite

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  -42.abs
end

# Finishing an example

raise if actual.to_s != "42"

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  -42.-(2)
end

# Finishing an example

raise if actual.to_s != "-44"

# ------------------------------------------------------------------------------

# End of the brutal test
