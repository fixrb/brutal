# Some array concatenation unit tests

# ------------------------------------------------------------------------------

front_object = [42, Object]

# ------------------------------------------------------------------------------

actual = begin
  front_object + [nil, "!"]
end

raise unless actual.to_s == "[42, Object, nil, \"!\"]"
raise unless actual.length == 4

# ------------------------------------------------------------------------------

actual = begin
  front_object + [nil, '!!']
end

raise unless actual.to_s == "[42, Object, nil, \"!!\"]"
raise unless actual.length == 4

# ------------------------------------------------------------------------------

actual = begin
  front_object + [nil, "..."]
end

raise unless actual.to_s == "[42, Object, nil, \"...\"]"
raise unless actual.length == 4

# ------------------------------------------------------------------------------

actual = begin
  front_object + [1, "!"]
end

raise unless actual.to_s == "[42, Object, 1, \"!\"]"
raise unless actual.length == 4

# ------------------------------------------------------------------------------

actual = begin
  front_object + [1, '!!']
end

raise unless actual.to_s == "[42, Object, 1, \"!!\"]"
raise unless actual.length == 4

# ------------------------------------------------------------------------------

actual = begin
  front_object + [1, "..."]
end

raise unless actual.to_s == "[42, Object, 1, \"...\"]"
raise unless actual.length == 4
