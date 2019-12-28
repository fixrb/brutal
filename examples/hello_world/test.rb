# ------------------------------------------------------------------------------

front_object = "Hello "

# ------------------------------------------------------------------------------

actual = front_object + 'Alice'

raise unless actual.to_s == "Hello Alice"
raise unless actual.length == 11

# ------------------------------------------------------------------------------

actual = front_object + 'Bob'

raise unless actual.to_s == "Hello Bob"
raise unless actual.length == 9
