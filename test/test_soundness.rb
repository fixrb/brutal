# frozen_string_literal: true

require_relative File.join("support", "coverage")
require_relative File.join("..", "lib", "brutal")
require_relative File.join("support", "project")

valid = "subject: '%{a} + 1'\ncontexts: {a: [1]}\nactuals: ['%{subject}']\n"

# Each section, subject and actual must be complete code on its own: a part
# cannot change how the others parse, so it cannot skip, swallow or reorder
# a check.
{
  "header: |\n  return if\n"                           => "the header is not complete code on its own: ",
  "before: begin\nafter: |\n  rescue\n  end\n"         => "the before is not complete code on its own: ",
  "before: (k = (k || -2) + 2).times do\nafter: end\n" => "the before is not complete code on its own: ",
  "after: =begin\nfooter: =end\n"                      => "the after is not complete code on its own: ",
  "footer: '(1'\n"                                     => "the footer is not complete code on its own: "
}.each do |sections, message|
  path = manifest("#{sections}subject: '1 + %{n}'\ncontexts: {n: [0]}\nactuals: ['%{subject}']\n")
  raise "#{sections.dump}: #{failure(path)}" unless failure(path)&.start_with?(message)
end
unbalanced = manifest("subject: '1 + %{n}'\ncontexts: {n: [0]}\nactuals: ['%{subject})) || ((true']\n")
raise unless failure(unbalanced).start_with?('the actual "%{subject})) || ((true" is not complete code on its own: ')
opened = manifest("subject: '[1, %{n}'\ncontexts: {n: [0]}\nactuals: ['%{subject}']\n")
raise unless failure(opened).start_with?("the subject, for n = 0, is not complete code on its own: line 1: ")
raise if failure(opened).include?("<compiled>")
fragment = manifest("subject: '[1, %{n}]'\ncontexts: {n: ['0', '1]]) || ([[2']}\nactuals: ['%{subject}']\n")
raise unless failure(fragment).start_with?("the subject, for n = 1]]) || ([[2, is not complete code on its own: ")
ended = manifest("after: |\n  x = 1\n  __END__\nsubject: '1 + %{n}'\ncontexts: {n: [0]}\nactuals: ['%{subject}']\n")
raise unless failure(ended) == "the after holds an end of file (__END__, NUL, ^D or ^Z)"
["\\0", "\\x04", "\\x1A"].each do |character|
  path = manifest("before: \"x = 1#{character}\"\nsubject: '1 + %{n}'\ncontexts: {n: [0]}\nactuals: ['%{subject}']\n")
  raise character unless failure(path) == "the before holds an end of file (__END__, NUL, ^D or ^Z)"
end
raise unless $VERBOSE

# A magic comment of the first line is ignored in a part compiled alone, as
# it is in the test file.
encoded = manifest("header: |\n  # encoding: bogus\n  x = 1\n#{valid}")
raise unless Brutal.generate(encoded).source.include?("(2).eql?((")

# %{name} is only replaced in the subject; elsewhere it is refused.
%w[header before after footer].each do |section|
  path = manifest("#{section}: 'limit = %{a}'\n#{valid}")
  raise unless failure(path) == "the #{section} uses %{a}, which is not replaced"
end

# The code runs as `ruby test_x.rb` runs it: no arguments, `$0` is the test
# file, and nothing comes from the standard input.
environment = manifest("subject: '[ARGV, $0 == __FILE__, gets, %{n}]'\ncontexts: {n: [1]}\nactuals: ['%{subject}']\n")
raise unless Brutal.generate(environment).source.include?("([[], true, nil, 1]).eql?((")

# What differs between brutal's child and a new ruby process is caught when
# the test file runs, before it is written.
["\"abc\".hash", "Object.new.object_id", "defined?(Brutal)", "1.respond_to?(:to_yaml)", "__FILE__"].each do |code|
  path = manifest("subject: '[%{v}]'\ncontexts: {v: ['#{code}']}\nactuals: ['%{subject}']\n")
  test = Brutal.generate(path)
  begin
    Brutal.write(test)
    raise "#{code}: expected Brutal::Error"
  rescue Brutal::Error => e
    raise "#{code}: #{e.message}" unless e.message.include?(": v = #{code}: actual (RuntimeError) (exit status 1)")
  end
  raise "#{code}: written" unless Dir.children(File.dirname(path)) == ["x_brutal.yaml"]
end

# Only exact core classes come back, keys included, and without what was
# added to them.
{
  "Class.new(Array).new"                    => "an instance of an anonymous class",
  "Class.new(Hash).new"                     => "an instance of an anonymous class",
  "{Class.new(String).new => 1}"            => "an instance of an anonymous class",
  "o = Object.new; def o.class = String; o" => "an instance of Object"
}.each do |code, what|
  path = manifest("subject: '%{v}'\ncontexts: {v: [\"#{code}\"]}\nactuals: ['%{subject}']\n")
  message = "v = #{code}: actual is #{what}, which brutal cannot write as a literal"
  raise "#{code}: #{failure(path)}" unless failure(path) == message
end
single = manifest("subject: 's = %{v}.dup; def s.extra = 1; s'\ncontexts: {v: ['\"x\"']}\nactuals: ['%{subject}']\n")
raise unless Brutal.generate(single).source.include?('("x").eql?((')
sneaky = manifest("header: |\n  class Sneaky < StandardError\n    def class = Integer\n  end\n" \
                  "subject: 'raise Sneaky, %{m}'\ncontexts: {m: ['\"x\"']}\nactuals: ['%{subject}']\n")
raise unless failure(sneaky) == 'm = "x": Sneaky: x'
loud = manifest("header: |\n  class Loud < StandardError\n    def self.name = raise(\"no\")\n  end\n" \
                "subject: 'raise Loud if %{n}'\ncontexts: {n: ['true']}\nactuals: ['%{subject}']\n")
raise unless failure(loud) == "n = true: an exception, whose message cannot be read"
named = manifest("subject: 'Class.new { def self.name = raise(%{m}) }.new'\ncontexts: {m: ['\"no\"']}\n" \
                 "actuals: ['%{subject}']\n")
raise unless failure(named) == 'm = "no": RuntimeError: no'

# A value nested 100 levels deep is written; one more level is refused.
depth = "subject: 'a = []; %{n}.times { a = [a] }; a'\ncontexts: {n: [N]}\nactuals: ['%{subject}']\n"
raise if failure(manifest(depth.sub("N", "100")))
cyclic = "is nested more than 100 levels deep, or contains itself, which brutal cannot write as a literal"
raise unless failure(manifest(depth.sub("N", "101"))).end_with?(cyclic)

# Through a symbolic link, the code sees the real directory, as ruby shows it,
# and the path of the test file follows the path of the manifest as given.
real = project("x_brutal.yaml" => "subject: '[__dir__ == File.realpath(__dir__), %{n}]'\n" \
                                  "contexts: {n: [1]}\nactuals: ['%{subject}']\n")
link = File.join(project({}), "link")
File.symlink(real, link)
raise unless Brutal.generate(File.join(link, "x_brutal.yaml")).source.include?("([true, 1]).eql?((")
Dir.chdir(real) { raise unless Brutal.generate("x_brutal.yaml").path == "test_x.rb" }

# __LINE__ is the line of the subject in the test file.
lines = manifest("subject: '[__LINE__, %{n}]'\ncontexts: {n: [1]}\nactuals: ['%{subject}']\n")
raise unless Brutal.generate(lines).source.include?("([6, 1]).eql?((")

# Helpers stay private, and a Brutal::Error is a StandardError.
raise if Brutal.respond_to?(:literal) || Brutal::CLI.respond_to?(:process) ||
         Brutal::Literal.respond_to?(:string) || Brutal::Output.respond_to?(:install)
raise unless Brutal::Error.superclass.equal?(StandardError)

# A symbol is written bare only when its whole name is an identifier.
raise unless %I[a?? 1\nx 1a].map { |name| Brutal::Literal.dump(name) } == [':"a??"', ':"1\nx"', ':"1a"']

# A %{ that does not start a name is left as written.
raise if failure(manifest("subject: '\"%{1a}\" + %{n}'\ncontexts: {n: ['\"x\"']}\nactuals: ['%{subject}']\n"))

# Without fork(2), brutal says so.
unsupported = false
Aw.singleton_class.prepend(Module.new { define_method(:supported?) { !unsupported && super() } })
begin
  unsupported = true
  raise unless failure(manifest(valid)) == "brutal needs fork(2), which this Ruby does not have"
ensure
  unsupported = false
end

# A test file run by ruby: nil when it passes, else why, warnings aside.
directory = project(
  "test_pass.rb"   => "warn 'not a failure'\n",
  "test_fail.rb"   => "warn 'x.rb:1: warning: noise'\nraise 'broken'\n",
  "test_quiet.rb"  => "exit 3\n",
  "test_signal.rb" => "Process.kill(:TERM, Process.pid)\nsleep 1\n"
)
raise if Brutal::Runner.run(File.join(directory, "test_pass.rb"))
failing = Brutal::Runner.run(File.join(directory, "test_fail.rb"))
raise unless failing.end_with?("test_fail.rb:2:in '<main>': broken (RuntimeError) (exit status 1)",
                               "test_fail.rb:2:in `<main>': broken (RuntimeError) (exit status 1)")
raise unless Brutal::Runner.run(File.join(directory, "test_quiet.rb")) == "no message (exit status 3)"
raise unless Brutal::Runner.run(File.join(directory, "test_signal.rb")).end_with?("(killed by SIGTERM)")

# Interrupted while ruby runs the test file, brutal kills and reaps it.
File.write(File.join(directory, "test_slow.rb"), "File.write('#{directory}/started', '')\nsleep 30\n")
main = Thread.current
watcher = Thread.new do
  sleep 0.05 until File.exist?(File.join(directory, "started"))
  main.raise(Interrupt)
end
begin
  Brutal::Runner.run(File.join(directory, "test_slow.rb"))
  raise "expected Interrupt"
rescue Interrupt
  watcher.join
  raise unless Process.waitall.empty?
end

# Keys, labels and messages do not depend on the locale.
verbose = $VERBOSE
external = Encoding.default_external
begin
  $VERBOSE = nil
  Encoding.default_external = Encoding::UTF_8
  raise unless Brutal::Literal.dump({ "\u00E9" => 1 }) == '{"\u00E9" => 1}'
  accented = manifest("subject: '%{v}'\ncontexts: {v: ['\"\u00E9\"']}\nactuals: ['%{subject}']\n")
  raise unless Brutal.generate(accented).source.include?('::Kernel.raise "v = \"\u00E9\": actual" unless')
ensure
  Encoding.default_external = external
  $VERBOSE = verbose
end
binary = manifest("subject: 'raise %{m}'\ncontexts: {m: ['\"\\xFF\".b']}\nactuals: ['%{subject}']\n")
raise unless failure(binary).encoding == Encoding::UTF_8 && failure(binary).end_with?(": RuntimeError: \uFFFD")
sjis = manifest("subject: 'raise %{m}'\ncontexts: {m: ['\"\\x82\".dup.force_encoding(\"Shift_JIS\")']}\n" \
                "actuals: ['%{subject}']\n")
raise unless failure(sjis).end_with?(": RuntimeError: \uFFFD")

# An unchanged test file is run again: the code may have changed in a way
# brutal's child does not see.
changing = manifest("header: require_relative 'lib'\n#{valid.sub("%{a} + 1", "answer + %{a}")}",
                    "lib.rb" => "def answer = 1\n")
test = Brutal.generate(changing)
Brutal.write(test)
File.write(File.join(File.dirname(changing), "lib.rb"), "def answer = defined?(Brutal) ? 1 : 0\n")
raise unless Brutal.generate(changing) == test
begin
  Brutal.write(test)
  raise "expected Brutal::Error"
rescue Brutal::Error => e
  raise unless e.message.start_with?("the test file fails when ruby runs it: #{test.path}:")
end

# A process the test file leaves running does not keep brutal waiting.
helper = manifest("header: Process.detach(Process.spawn('sleep', '5'))\n#{valid}")
started = Process.clock_gettime(Process::CLOCK_MONOTONIC)
Brutal.write(Brutal.generate(helper))
raise unless Process.clock_gettime(Process::CLOCK_MONOTONIC) - started < 10
raise unless Dir.children(File.dirname(helper)).sort == %w[test_x.rb x_brutal.yaml]
