# Some array concatenation unit tests

# ------------------------------------------------------------------------------

actual = begin
  [42, Object] + [nil, "!"]
end

raise unless actual.to_s == "[42, Object, nil, \"!\"]"
raise unless actual.length == 4

# ------------------------------------------------------------------------------

actual = begin
  [42, Object] + [nil, '!!']
end

raise unless actual.to_s == "[42, Object, nil, \"!!\"]"
raise unless actual.length == 4

# ------------------------------------------------------------------------------

actual = begin
  [42, Object] + [nil, "..."]
end

raise unless actual.to_s == "[42, Object, nil, \"...\"]"
raise unless actual.length == 4

# ------------------------------------------------------------------------------

actual = begin
  [42, Object] + [1, "!"]
end

raise unless actual.to_s == "[42, Object, 1, \"!\"]"
raise unless actual.length == 4

# ------------------------------------------------------------------------------

actual = begin
  [42, Object] + [1, '!!']
end

raise unless actual.to_s == "[42, Object, 1, \"!!\"]"
raise unless actual.length == 4

# ------------------------------------------------------------------------------

actual = begin
  [42, Object] + [1, "..."]
end

raise unless actual.to_s == "[42, Object, 1, \"...\"]"
raise unless actual.length == 4
