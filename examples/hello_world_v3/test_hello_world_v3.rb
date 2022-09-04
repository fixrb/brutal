# Brutal test suite

# ------------------------------------------------------------------------------

actual = begin
  "Hello Miss Alice"
end

raise if actual.length != 16
raise if actual.to_s != "Hello Miss Alice"

# ------------------------------------------------------------------------------

actual = begin
  "Hello Miss Bob"
end

raise if actual.length != 14
raise if actual.to_s != "Hello Miss Bob"

# ------------------------------------------------------------------------------

actual = begin
  "Hello Mr Alice"
end

raise if actual.length != 14
raise if actual.to_s != "Hello Mr Alice"

# ------------------------------------------------------------------------------

actual = begin
  "Hello Mr Bob"
end

raise if actual.length != 12
raise if actual.to_s != "Hello Mr Bob"

# ------------------------------------------------------------------------------

actual = begin
  "Hello Mrs Alice"
end

raise if actual.length != 15
raise if actual.to_s != "Hello Mrs Alice"

# ------------------------------------------------------------------------------

actual = begin
  "Hello Mrs Bob"
end

raise if actual.length != 13
raise if actual.to_s != "Hello Mrs Bob"
