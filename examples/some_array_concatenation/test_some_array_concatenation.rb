# Some array concatenation unit tests

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  [42, Object] + [nil, "!"]
end

# Finishing an example

raise if actual.length != 4
raise if actual.to_s != "[42, Object, nil, \"!\"]"

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  [42, Object] + [nil, '!!']
end

# Finishing an example

raise if actual.length != 4
raise if actual.to_s != "[42, Object, nil, \"!!\"]"

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  [42, Object] + [nil, "..."]
end

# Finishing an example

raise if actual.length != 4
raise if actual.to_s != "[42, Object, nil, \"...\"]"

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  [42, Object] + [1, "!"]
end

# Finishing an example

raise if actual.length != 4
raise if actual.to_s != "[42, Object, 1, \"!\"]"

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  [42, Object] + [1, '!!']
end

# Finishing an example

raise if actual.length != 4
raise if actual.to_s != "[42, Object, 1, \"!!\"]"

# ------------------------------------------------------------------------------

# Starting an example

actual = begin
  [42, Object] + [1, "..."]
end

# Finishing an example

raise if actual.length != 4
raise if actual.to_s != "[42, Object, 1, \"...\"]"

# ------------------------------------------------------------------------------

# End of the brutal test
