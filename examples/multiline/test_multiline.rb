# Brutal test suite

# ------------------------------------------------------------------------------

# Before example

actual = begin
  # This is a useless comment.
  -42.abs
end

# After example

raise if actual.to_s != "42"

# ------------------------------------------------------------------------------

# Before example

actual = begin
  # This is a useless comment.
  -42.-(2)
end

# After example

raise if actual.to_s != "-44"

# ------------------------------------------------------------------------------

# End of test
