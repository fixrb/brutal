# Some string concatenation unit tests

# ------------------------------------------------------------------------------

actual = "Hello" + "!"

raise unless actual.to_s == "Hello!"
raise unless actual.length == 6

# ------------------------------------------------------------------------------

actual = "Hello" + "..."

raise unless actual.to_s == "Hello..."
raise unless actual.length == 8

# ------------------------------------------------------------------------------

actual = "Hello" + ", Bob!"

raise unless actual.to_s == "Hello, Bob!"
raise unless actual.length == 11

# ------------------------------------------------------------------------------

actual = "Hello" + ", Bob..."

raise unless actual.to_s == "Hello, Bob..."
raise unless actual.length == 13
