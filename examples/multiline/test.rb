# Brutal test suite

# ------------------------------------------------------------------------------

actual = begin
  # This is a useless comment.
  -42.abs
end

raise if actual.to_s != "42"

# ------------------------------------------------------------------------------

actual = begin
  # This is a useless comment.
  -42.-(2)
end

raise if actual.to_s != "-44"
