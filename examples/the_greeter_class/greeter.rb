# The Greeter class
class Greeter
  def initialize(name)
    @name = name.capitalize
  end

  def salute
    "Hello #{@name}!"
  end
end
