# Brutal test suite

# ------------------------------------------------------------------------------

# Before example

actual = begin
  # This is a useless comment.
  -42.abs
end

raise if actual.to_s != "42"

# After example

# ------------------------------------------------------------------------------

# Before example

actual = begin
  # This is a useless comment.
  -42.-(2)
end

raise if actual.to_s != "-44"

# After example

# ------------------------------------------------------------------------------

# End of test
