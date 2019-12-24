# Some array concatenation unit tests

# ------------------------------------------------------------------------------

front_object = [42, Object]

# ------------------------------------------------------------------------------

actual = front_object + [nil, "!"]
raise unless actual.to_s == "[42, Object, nil, \"!\"]"
raise unless actual.length == 4

# ------------------------------------------------------------------------------

actual = front_object + [nil, '!!']
raise unless actual.to_s == "[42, Object, nil, \"!!\"]"
raise unless actual.length == 4

# ------------------------------------------------------------------------------

actual = front_object + [nil, "..."]
raise unless actual.to_s == "[42, Object, nil, \"...\"]"
raise unless actual.length == 4

# ------------------------------------------------------------------------------

actual = front_object + [1, "!"]
raise unless actual.to_s == "[42, Object, 1, \"!\"]"
raise unless actual.length == 4

# ------------------------------------------------------------------------------

actual = front_object + [1, '!!']
raise unless actual.to_s == "[42, Object, 1, \"!!\"]"
raise unless actual.length == 4

# ------------------------------------------------------------------------------

actual = front_object + [1, "..."]
raise unless actual.to_s == "[42, Object, 1, \"...\"]"
raise unless actual.length == 4
