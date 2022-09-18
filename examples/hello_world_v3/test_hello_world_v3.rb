# Brutal test suite

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  "Hello Miss Alice"
end

# Finishing an example

raise if actual.length != 16
raise if actual.to_s != "Hello Miss Alice"

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  "Hello Miss Bob"
end

# Finishing an example

raise if actual.length != 14
raise if actual.to_s != "Hello Miss Bob"

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  "Hello Mr Alice"
end

# Finishing an example

raise if actual.length != 14
raise if actual.to_s != "Hello Mr Alice"

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  "Hello Mr Bob"
end

# Finishing an example

raise if actual.length != 12
raise if actual.to_s != "Hello Mr Bob"

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  "Hello Mrs Alice"
end

# Finishing an example

raise if actual.length != 15
raise if actual.to_s != "Hello Mrs Alice"

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  "Hello Mrs Bob"
end

# Finishing an example

raise if actual.length != 13
raise if actual.to_s != "Hello Mrs Bob"

# ------------------------------------------------------------------------------

# End of the brutal test
