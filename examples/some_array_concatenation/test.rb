# Some array concatenation unit tests

# ------------------------------------------------------------------------------

actual = begin
  [42, Object] + [nil, "!"]
end

raise if actual.to_s != "[42, Object, nil, \"!\"]"
raise if actual.length != 4

# ------------------------------------------------------------------------------

actual = begin
  [42, Object] + [nil, '!!']
end

raise if actual.to_s != "[42, Object, nil, \"!!\"]"
raise if actual.length != 4

# ------------------------------------------------------------------------------

actual = begin
  [42, Object] + [nil, "..."]
end

raise if actual.to_s != "[42, Object, nil, \"...\"]"
raise if actual.length != 4

# ------------------------------------------------------------------------------

actual = begin
  [42, Object] + [1, "!"]
end

raise if actual.to_s != "[42, Object, 1, \"!\"]"
raise if actual.length != 4

# ------------------------------------------------------------------------------

actual = begin
  [42, Object] + [1, '!!']
end

raise if actual.to_s != "[42, Object, 1, \"!!\"]"
raise if actual.length != 4

# ------------------------------------------------------------------------------

actual = begin
  [42, Object] + [1, "..."]
end

raise if actual.to_s != "[42, Object, 1, \"...\"]"
raise if actual.length != 4
