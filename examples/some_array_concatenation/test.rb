# Some array concatenation unit tests

# ------------------------------------------------------------------------------

actual = begin
  [42, Object] + [nil, "!"]
end

raise if actual.length != 4
raise if actual.to_s != "[42, Object, nil, \"!\"]"

# ------------------------------------------------------------------------------

actual = begin
  [42, Object] + [nil, '!!']
end

raise if actual.length != 4
raise if actual.to_s != "[42, Object, nil, \"!!\"]"

# ------------------------------------------------------------------------------

actual = begin
  [42, Object] + [nil, "..."]
end

raise if actual.length != 4
raise if actual.to_s != "[42, Object, nil, \"...\"]"

# ------------------------------------------------------------------------------

actual = begin
  [42, Object] + [1, "!"]
end

raise if actual.length != 4
raise if actual.to_s != "[42, Object, 1, \"!\"]"

# ------------------------------------------------------------------------------

actual = begin
  [42, Object] + [1, '!!']
end

raise if actual.length != 4
raise if actual.to_s != "[42, Object, 1, \"!!\"]"

# ------------------------------------------------------------------------------

actual = begin
  [42, Object] + [1, "..."]
end

raise if actual.length != 4
raise if actual.to_s != "[42, Object, 1, \"...\"]"
