# frozen_string_literal: true

module Brutal
  # Writes an observed value as a Ruby literal, the same whatever the version
  # of Ruby and the locale: `nil`, `true`, `false`, an `Integer`, a finite
  # `Float`, a `String` in UTF-8, in binary or with ASCII characters only, a
  # `Symbol`, and an `Array` or a `Hash` of these. Anything else is refused,
  # never written as its `inspect`.
  module Literal
    SYMBOL = /\A[A-Za-z_][A-Za-z0-9_]*[?!]?\z/
    private_constant :SYMBOL

    # @param value [Object] a value made of the classes above only
    # @return [String] Ruby source code that evaluates to a value `eql?` to it
    # @raise [Brutal::Error] when the value cannot be written as a literal
    def self.dump(value)
      case value
      when nil, true, false, ::Integer then value.inspect
      when ::Float then float(value)
      when ::String then string(value)
      when ::Symbol then symbol(value)
      when ::Array then "[#{value.map { |item| dump(item) }.join(", ")}]"
      when ::Hash then pairs(value)
      else raise Error, "is an instance of #{value.class}"
      end
    end

    # A finite Float, as Float#to_s writes it: the shortest exact form.
    def self.float(value)
      raise Error, "is the Float #{value}" unless value.finite?

      value.to_s
    end

    # A String with its escapes from String#dump, which ignores the locale;
    # `.b` keeps a binary string binary.
    def self.string(value)
      return value.dump if value.encoding == ::Encoding::UTF_8 || value.ascii_only?
      return "#{value.dump}.b" if value.encoding == ::Encoding::BINARY

      raise Error, "is a String in #{value.encoding}"
    end

    # A Symbol, quoted unless its name is a plain identifier.
    def self.symbol(value)
      name = value.name
      return ":#{name}" if SYMBOL.match?(name)
      return ":#{name.dump}" if name.encoding == ::Encoding::UTF_8 || name.ascii_only?

      raise Error, "is a Symbol in #{name.encoding}"
    end

    # A Hash, with `=>` for every key.
    def self.pairs(value)
      return "{}" if value.empty?

      "{#{value.map { |key, item| "#{dump(key)} => #{dump(item)}" }.join(", ")}}"
    end

    private_class_method :float, :string, :symbol, :pairs
  end
end
