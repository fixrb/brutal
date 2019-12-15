# Some string concatenation unit tests

# ------------------------------------------------------------------------------

result = "Hello" + "!"

raise unless result.to_s == "Hello!"
raise unless result.length == 6

# ------------------------------------------------------------------------------

result = "Hello" + "..."

raise unless result.to_s == "Hello..."
raise unless result.length == 8

# ------------------------------------------------------------------------------

result = "Hello" + ", Bob!"

raise unless result.to_s == "Hello, Bob!"
raise unless result.length == 11

# ------------------------------------------------------------------------------

result = "Hello" + ", Bob..."

raise unless result.to_s == "Hello, Bob..."
raise unless result.length == 13
