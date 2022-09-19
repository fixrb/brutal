puts "Hello from header 👋"

# ------------------------------------------------------------------------------

puts "Hello from before 👋"

actual = begin
  "Hello " + 'Alice'
end

raise if actual.length != 11
raise if actual.to_s != "Hello Alice"

puts "Hello from after 👋"

# ------------------------------------------------------------------------------

puts "Hello from before 👋"

actual = begin
  "Hello " + 'Bob'
end

raise if actual.length != 9
raise if actual.to_s != "Hello Bob"

puts "Hello from after 👋"

# ------------------------------------------------------------------------------

puts "Hello from footer 👋"
