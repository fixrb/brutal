# Brutal test suite

# ------------------------------------------------------------------------------

actual = begin
  "Hello " + "Alice"
end

raise if actual.length != 11
raise if actual.to_s != "Hello Alice"

# ------------------------------------------------------------------------------

actual = begin
  "Hello " + "Bob"
end

raise if actual.length != 9
raise if actual.to_s != "Hello Bob"
