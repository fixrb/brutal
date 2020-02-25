# Brutal test suite

# ------------------------------------------------------------------------------

actual = begin
  "Hello " + "Alice"
end

raise unless actual.to_s == "Hello Alice"
raise unless actual.length == 11

# ------------------------------------------------------------------------------

actual = begin
  "Hello " + "Bob"
end

raise unless actual.to_s == "Hello Bob"
raise unless actual.length == 9
