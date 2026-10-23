# frozen_string_literal: true

require_relative File.join("support", "coverage")
require_relative File.join("..", "lib", "brutal")

# The literal of a value, or the message of the error it raises.
def dump(value)
  Brutal::Literal.dump(value)
rescue Brutal::Error => e
  e.message
end

# Every literal evaluates to a value eql? to the original, with its encoding.
values = [
  nil, true, false, 0, -42, 2**100, -(2**100), 0.1, -1.5, 1e20, 1e-5, -0.0, 100.0,
  "", "plain", "quote \" backslash \\ hash \#{x} \#$y \#@z", "tab\tline\nnull\0bell\a",
  "h\u00E9llo \u{1F600} \u202Eevil", "\xFF\xFE".dup.force_encoding("UTF-8"), "\xFF\x00".b, "ascii".b,
  "ascii".encode("US-ASCII"), "caf\u00E9".encode("UTF-8"),
  :plain, :Const, :question?, :bang!, :setter=, :"with space", :+, :[], :hé, :"", :if, :nil,
  [], [1, [2, [3, []]]], {}, { a: 1, "b" => [2.5, nil], 3 => { c: :d } }, [{}, [{ "k" => "v" }]]
]
values.each do |value|
  literal = dump(value)
  copy = eval(literal) # rubocop:disable Security/Eval
  raise "#{value.inspect}: #{literal}" unless copy.eql?(value) && copy.instance_of?(value.class)
  raise "#{value.inspect}: #{literal}" if copy.is_a?(String) && copy.encoding != value.encoding && !value.ascii_only?
end

# The written forms, which do not depend on the version of Ruby or the
# locale: no inspect, no `key:` shorthand, non-ASCII characters escaped.
raise unless dump(nil) == "nil" && dump(true) == "true" && dump(false) == "false"
raise unless dump(-42) == "-42"
raise unless dump(0.1) == "0.1" && dump(1e20) == "1.0e+20" && dump(-0.0) == "-0.0"
raise unless dump("h\u00E9llo") == '"h\u00E9llo"'
raise unless dump("\u202E") == '"\u202E"'
raise unless dump("\#{x}") == '"\#{x}"'
raise unless dump("\xFF".b) == '"\xFF".b'
raise unless dump("ascii".b) == '"ascii"'
raise unless dump(:plain) == ":plain" && dump(:question?) == ":question?"
raise unless dump(:"with space") == ':"with space"' && dump(:+) == ':"+"'
raise unless dump([1, [:a, "b"]]) == '[1, [:a, "b"]]'
raise unless dump({}) == "{}"
raise unless dump({ a: 1, "b" => nil }) == '{:a => 1, "b" => nil}'
verbose = $VERBOSE
default_external = Encoding.default_external
begin
  $VERBOSE = nil
  Encoding.default_external = Encoding::US_ASCII
  raise unless dump("h\u00E9llo") == '"h\u00E9llo"'
ensure
  Encoding.default_external = default_external
  $VERBOSE = verbose
end

# Anything else is refused, with what it is.
raise unless dump(Float::NAN) == "is the Float NaN"
raise unless dump(Float::INFINITY) == "is the Float Infinity"
raise unless dump(-Float::INFINITY) == "is the Float -Infinity"
raise unless dump("caf\u00E9".encode("ISO-8859-1")) == "is a String in ISO-8859-1"
raise unless dump("a".encode("UTF-16LE")) == "is a String in UTF-16LE"
raise unless dump("caf\u00E9".encode("ISO-8859-1").to_sym) == "is a Symbol in ISO-8859-1"
raise unless dump([1, Float::NAN]) == "is the Float NaN"
raise unless dump({ a: Object.new }) == "is an instance of Object"
raise unless dump(1r) == "is an instance of Rational"
