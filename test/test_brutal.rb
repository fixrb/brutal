# frozen_string_literal: true

require_relative File.join("support", "coverage")
require_relative File.join("..", "lib", "brutal")
require_relative File.join("support", "project")

# Generates the test file and writes it; returns its path.
def written(path)
  test = Brutal.generate(path)
  Brutal.write(test)
  test.path
end

# The test file is plain Ruby, next to the manifest, and passes.
calc = manifest(<<~YAML, "calc.rb" => "class Calc\n  def add(a, b) = a + b\nend\n")
  header: require_relative "calc"
  subject: Calc.new.add(%{a}, %{b})
  contexts:
    a: [1, 2]
    b: [3]
  actuals:
    - "%{subject}"
    - "%{subject}.to_s"
YAML
test = Brutal.generate(calc)
raise unless test.path == File.join(File.dirname(calc), "test_x.rb")
assertion = "::Kernel.raise \"a = 2, b = 3: actual.to_s\" unless (\"5\").eql?((\n  actual.to_s\n))\n"
raise unless test.source.include?(assertion)
raise unless test.frozen? && Brutal::Test.members == %i[path source]
raise if File.exist?(test.path)
raise unless passes?(written(calc))

# The test is strict: the expected value receives eql?, so an Integer that
# becomes a Float, or an object that claims to be equal, fails.
File.write(File.join(File.dirname(calc), "calc.rb"), "class Calc\n  def add(a, b) = (a + b).to_f\nend\n")
raise if passes?(File.join(File.dirname(calc), "test_x.rb"))
liar = "class Liar < BasicObject\n  def ==(*) = true\n  def !=(*) = false\n  def eql?(*) = true\nend\n" \
       "class Calc\n  def add(*) = Liar.new\nend\n"
File.write(File.join(File.dirname(calc), "calc.rb"), liar)
raise if passes?(File.join(File.dirname(calc), "test_x.rb"))

# The code runs as the test file runs: at the top level, with `self` as
# `main`, locals shared by the sections, classes reopened, the magic
# comments of the header, and the `__dir__` of the test file.
semantics = manifest(<<~YAML, "lib/shout.rb" => "class String\n  def shout = upcase + \"!\"\nend\n")
  header: |
    # frozen_string_literal: true

    require_relative "lib/shout"
    class Integer
      def double = self * 2
    end
    base = 10
  before: count = base
  subject: "[self.to_s, %{n}.double + count, 'x'.frozen?, 'a'.shout, File.basename(__dir__) == File.basename(Dir.pwd)]"
  contexts:
    n: [1]
  actuals:
    - "%{subject}"
YAML
raise unless Brutal.generate(semantics).source.include?('(["main", 12, true, "A!", false]).eql?((')
raise unless Brutal.generate(semantics).source.include?("count = base")
raise if 1.respond_to?(:double) || "a".respond_to?(:shout) || defined?(base)

# What the code does to the process stays in its child: a patch in one
# manifest does not reach the next one.
patched = manifest(<<~YAML)
  header: |
    class ::Integer
      remove_method :+
      def +(_other) = 42
    end
  subject: "%{a} + 1"
  contexts:
    a: [1]
  actuals: ["%{subject}"]
YAML
clean = manifest("subject: '%{a} + 1'\ncontexts: {a: [1]}\nactuals: ['%{subject}']\n")
raise unless Brutal.generate(patched).source.include?("unless (42).eql?((")
raise unless Brutal.generate(clean).source.include?("unless (2).eql?((")
raise unless 1 + 1 == 2

# The code cannot reach brutal: its locals, instance variables and methods
# are not in scope.
reach = manifest(<<~YAML)
  header: |
    string = nil
    @actuals = []
    def source(*) = ""
  after: lines = nil
  subject: "%{a}"
  contexts:
    a: [1, 2]
  actuals: ["%{subject}"]
YAML
raise unless Brutal.generate(reach).source.scan("::Kernel.raise").size == 2

# A % is a % in the code; only %{name} is replaced.
percent = manifest(<<~YAML)
  subject: |-
    [%{n} % 3, "%05d" % %{n}, format("%<v>s items", v: %{n} * 2), %w[a b].size]
  contexts:
    n: [7]
  actuals: ["%{subject}"]
YAML
raise unless Brutal.generate(percent).source.include?('([1, "00007", "14 items", 2]).eql?((')

# Contexts are code written as text: YAML does not retype them, and
# nothing is stripped.
text = manifest(<<~YAML)
  subject: "[%{list}].join(%{sep})"
  contexts:
    list:
      - 1,2
      - "1_000"
    sep:
      - '", "'
  actuals: ["%{subject}"]
YAML
source = Brutal.generate(text).source
raise unless source.include?('("1, 2").eql?((') && source.include?('("1000").eql?((')

# An actual is parenthesized: a rescue modifier or an `&&` stays inside it.
precedence = manifest(<<~YAML)
  subject: "{a: %{v}}"
  contexts:
    v: [1]
  actuals:
    - "%{subject}.fetch(:b) rescue :missing"
    - "%{subject}.any? && %{subject}.size"
    - "%{subject}.size # a trailing comment"
YAML
source = Brutal.generate(precedence).source
raise unless source.include?("(:missing).eql?((") && source.include?("(1).eql?((\n  actual.any? && actual.size\n))")
path = written(precedence)
File.write(path, source.sub("{a: 1}", "{b: :oops}"))
raise if passes?(path)

# Values are written as literals, nested ones included; a hash with a
# default block is written as its pairs.
nested_values = manifest(<<~YAML)
  subject: "Hash.new { |hash, key| hash[key] = [key] }.merge(%{v} => [1, {'b' => nil}, :c, 2.5])"
  contexts:
    v: [":a"]
  actuals: ["%{subject}", "%{subject}[:a].last"]
YAML
source = Brutal.generate(nested_values).source
raise unless source.include?('({:a => [1, {"b" => nil}, :c, 2.5]}).eql?((')
raise unless source.include?("(2.5).eql?((\n  actual[:a].last\n))")

# A value written as its inspect could hide the next assertion behind a
# comment: such a value is refused, never written.
objects = manifest(<<~YAML, "point.rb" => "Point = Struct.new(:x, :y)\n")
  header: |
    require_relative "point"
    require "set"
  subject: "%{v}"
  contexts:
    v:
      - Point.new(0, 0)
  actuals: ["%{subject}"]
YAML
raise unless failure(objects) == "v = Point.new(0, 0): actual is an instance of Point, " \
                                 "which brutal cannot write as a literal"
nested = manifest("subject: '[1, [%{v}]]'\ncontexts: {v: [Object.new]}\nactuals: ['%{subject}']\n")
raise unless failure(nested) == "v = Object.new: actual is an instance of Object, " \
                                "which brutal cannot write as a literal"
{
  "Set[1]" => "an instance of Set", "1r" => "an instance of Rational", "(1..3)" => "an instance of Range",
  "BasicObject.new" => "a BasicObject", "Class.new.new" => "an instance of an anonymous class",
  "Class.new(String).new" => "an instance of an anonymous class", "Float::NAN" => "the Float NaN",
  "'x'.encode('UTF-16LE')" => "a String in UTF-16LE"
}.each do |code, what|
  path = manifest("header: require 'set'\nsubject: '%{v}'\ncontexts: {v: [\"#{code}\"]}\nactuals: ['%{subject}']\n")
  message = "v = #{code}: actual is #{what}, which brutal cannot write as a literal"
  raise "#{code}: #{failure(path)}" unless failure(path) == message
end
deep = manifest("subject: 'a = []; a << a; %{v}'\ncontexts: {v: [a]}\nactuals: ['%{subject}']\n")
raise unless failure(deep).end_with?("is nested more than 100 levels deep, or contains itself, " \
                                     "which brutal cannot write as a literal")

# The code fails: brutal says where, and writes nothing.
raising = manifest(<<~YAML)
  subject: "10 / %{n}"
  contexts:
    n: [5, 0]
  actuals: ["%{subject}"]
YAML
raise unless failure(raising) == "n = 0: ZeroDivisionError: divided by 0"
header = manifest("header: raise 'not ready'\nsubject: '%{n}'\ncontexts: {n: [1]}\nactuals: ['%{subject}']\n")
raise unless failure(header) == "the header: RuntimeError: not ready"
footer = manifest("footer: missing\nsubject: '%{n}'\ncontexts: {n: [1]}\nactuals: ['%{subject}']\n")
raise unless failure(footer).start_with?("the footer: NameError: undefined local variable or method")
exiting = manifest("subject: 'exit; %{n}'\ncontexts: {n: [1]}\nactuals: ['%{subject}']\n")
raise unless failure(exiting) == "n = 1: SystemExit: exit"
syntax = manifest("subject: 'BEGIN { %{n} }'\ncontexts: {n: [1]}\nactuals: ['%{subject}']\n")
raise unless failure(syntax).start_with?("the code does not compile: ")
anonymous = manifest("subject: 'raise Class.new(StandardError), %{n}'\ncontexts: {n: ['\"boom\"']}\nactuals: [x]\n")
raise unless failure(anonymous) == 'n = "boom": an anonymous exception: boom'
unreadable = manifest(<<~YAML)
  header: |
    class Opaque < StandardError
      def message = raise("no")
    end
  subject: "raise Opaque if %{n}"
  contexts:
    n: ["true"]
  actuals: ["%{subject}"]
YAML
raise unless failure(unreadable) == "n = true: Opaque, whose message cannot be read"
binary = manifest("subject: 'raise %{m}'\ncontexts: {m: ['\"\\xFF\".b']}\nactuals: ['%{subject}']\n")
raise unless failure(binary).start_with?('m = "\xFF".b: RuntimeError: ') && failure(binary).valid_encoding?

# The process running the code ends without a result.
killed = manifest("subject: 'exit!(3) if %{n}'\ncontexts: {n: ['true']}\nactuals: ['%{subject}']\n")
raise unless failure(killed) == "the process running the code ended without a result (exit status 3)"
signaled = manifest("subject: 'Process.kill(:KILL, Process.pid) if %{n}'\ncontexts: {n: ['true']}\nactuals: [x]\n")
raise unless failure(signaled) == "the process running the code ended without a result (killed by SIGKILL)"

# The program must run to its end: a top-level return that skips a check
# is caught.
early = manifest("subject: '%{n}'\ncontexts: {n: [1, 2]}\nactuals: ['%{subject}']\nafter: return if actual == 1\n")
raise unless failure(early) == "observed values: 1, expected: 2; a check was skipped or repeated"
extra = manifest("subject: '%{n}'\ncontexts: {n: [1]}\nactuals: ['%{subject}']\nafter: $__brutal__.observe(actual)\n")
raise unless failure(extra) == "observed values: 2, expected: 1; a check was skipped or repeated"

# The test file is written once ruby has run it and it passed: a value that
# changes from one run to the next is caught, and nothing is written.
random = manifest("subject: 'Random.new_seed % %{n}'\ncontexts: {n: [1_000_000_007]}\nactuals: ['%{subject}']\n")
test = Brutal.generate(random)
begin
  Brutal.write(test)
  raise "expected Brutal::Error"
rescue Brutal::Error => e
  raise unless e.message.start_with?("the test file fails when ruby runs it: #{test.path}:")
  raise unless e.message.end_with?(": n = 1_000_000_007: actual (RuntimeError) (exit status 1)")
end
raise unless Dir.children(File.dirname(random)) == ["x_brutal.yaml"]
