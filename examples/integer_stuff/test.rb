# Brutal test suite

# ------------------------------------------------------------------------------

actual = begin
  -42.abs
end

raise unless actual.to_s == "42"

# ------------------------------------------------------------------------------

actual = begin
  -42.-(2)
end

raise unless actual.to_s == "-44"
