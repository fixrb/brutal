# Brutal test suite

# ------------------------------------------------------------------------------

actual = begin
  "Hello " + "Alice"
end

raise if actual.to_s != "Hello Alice"
raise if actual.length != 11

# ------------------------------------------------------------------------------

actual = begin
  "Hello " + "Bob"
end

raise if actual.to_s != "Hello Bob"
raise if actual.length != 9
