# ------------------------------------------------------------------------------

front_object = -42

# ------------------------------------------------------------------------------

actual = begin
  # This is a useless comment.
  front_object.abs
end

raise unless actual.to_s == "42"

# ------------------------------------------------------------------------------

actual = begin
  # This is a useless comment.
  front_object.-(2)
end

raise unless actual.to_s == "-44"
