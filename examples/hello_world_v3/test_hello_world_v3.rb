# Brutal test suite

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  "Hello Miss Alice"
end

raise if actual.length != 16
raise if actual.to_s != "Hello Miss Alice"

# Finishing a test

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  "Hello Miss Bob"
end

raise if actual.length != 14
raise if actual.to_s != "Hello Miss Bob"

# Finishing a test

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  "Hello Mr Alice"
end

raise if actual.length != 14
raise if actual.to_s != "Hello Mr Alice"

# Finishing a test

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  "Hello Mr Bob"
end

raise if actual.length != 12
raise if actual.to_s != "Hello Mr Bob"

# Finishing a test

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  "Hello Mrs Alice"
end

raise if actual.length != 15
raise if actual.to_s != "Hello Mrs Alice"

# Finishing a test

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  "Hello Mrs Bob"
end

raise if actual.length != 13
raise if actual.to_s != "Hello Mrs Bob"

# Finishing a test

# ------------------------------------------------------------------------------

# End of the brutal test
