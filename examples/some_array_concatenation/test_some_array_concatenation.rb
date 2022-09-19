# Some array concatenation unit tests

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  [42, Object] + [nil, "!"]
end

raise if actual.length != 4
raise if actual.to_s != "[42, Object, nil, \"!\"]"

# Finishing a test

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  [42, Object] + [nil, '!!']
end

raise if actual.length != 4
raise if actual.to_s != "[42, Object, nil, \"!!\"]"

# Finishing a test

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  [42, Object] + [nil, "..."]
end

raise if actual.length != 4
raise if actual.to_s != "[42, Object, nil, \"...\"]"

# Finishing a test

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  [42, Object] + [1, "!"]
end

raise if actual.length != 4
raise if actual.to_s != "[42, Object, 1, \"!\"]"

# Finishing a test

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  [42, Object] + [1, '!!']
end

raise if actual.length != 4
raise if actual.to_s != "[42, Object, 1, \"!!\"]"

# Finishing a test

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  [42, Object] + [1, "..."]
end

raise if actual.length != 4
raise if actual.to_s != "[42, Object, 1, \"...\"]"

# Finishing a test

# ------------------------------------------------------------------------------

# End of the brutal test
