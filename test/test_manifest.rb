# frozen_string_literal: true

require_relative File.join("support", "coverage")
require_relative File.join("..", "lib", "brutal")
require_relative File.join("support", "project")

# Reads a manifest, or returns the message of the error it raises; without
# text, no file is written.
def read(yaml, name: "x_brutal.yaml")
  Brutal::Manifest.read(File.join(project(yaml ? { name => yaml } : {}), name))
rescue Brutal::Error => e
  e.message
end

# Every value is the text written in the file, in the order of the file.
manifest = read(<<~YAML)
  ---
  header: |
    require "set"

  before: x = 1
  subject: "[%{b}, %{a}]"
  contexts:
    b:
      - 1,2
      - yes
      - ~
      - 12:30
      - .inf
      - 0x1F
    a:
      - ", "
      - "  padded  "
      - |
        "multi
        line"
  actuals:
    - "%{subject}"
    - |+
      %{subject}.size


  after: "x = nil"
  footer: "# done"
YAML
raise unless manifest.header == 'require "set"'
raise unless manifest.before == "x = 1"
raise unless manifest.subject == "[%{b}, %{a}]"
raise unless manifest.contexts.keys == %w[b a]
raise unless manifest.contexts["b"] == ["1,2", "yes", "~", "12:30", ".inf", "0x1F"]
raise unless manifest.contexts["a"] == [", ", "  padded  ", "\"multi\nline\""]
raise unless manifest.actuals == ["%{subject}", "%{subject}.size"]
raise unless manifest.after == "x = nil"
raise unless manifest.footer == "# done"
raise unless manifest.path.end_with?("x_brutal.yaml")
raise unless manifest.frozen? && manifest.contexts.frozen? && manifest.contexts["a"].frozen?
raise unless manifest.actuals.frozen? && manifest.subject.frozen?

# Optional sections may be left out.
minimal = read("subject: '%{a}'\ncontexts: {a: [1]}\nactuals: ['%{subject}']\n")
raise unless [minimal.header, minimal.before, minimal.after, minimal.footer].all?(&:nil?)
raise unless minimal.contexts == { "a" => ["1"] }

# A file name must be NAME_brutal.yaml, with a plain name, checked before
# the file is read.
raise unless read(nil, name: "x.yaml").start_with?("the file name must be NAME_brutal.yaml")
raise unless read(nil, name: "a b_brutal.yaml").start_with?("the file name must be NAME_brutal.yaml")
raise unless read(nil, name: "_brutal.yaml").start_with?("the file name must be NAME_brutal.yaml")

# The file is one YAML document, in UTF-8.
raise unless read("subject: \"\xFF\"\n".b) == "the file is not valid UTF-8"
raise unless read("") == "the file must hold one YAML document"
raise unless read("--- {}\n--- {}\n") == "the file must hold one YAML document"
raise unless read("subject: [\n").start_with?("invalid YAML at line ")
raise unless read("- a\n") == "the manifest must be a mapping"
raise unless read("just text\n") == "the manifest must be a mapping"

# Sections: known, once, and the required ones present.
valid = "subject: '%{a}'\ncontexts: {a: [1]}\nactuals: ['%{subject}']\n"
raise unless read("#{valid}setup: x\n") == 'unknown section "setup"'
raise unless read("#{valid}subject: other\n") == 'the manifest has the key "subject" twice'
raise unless read("contexts: {a: [1]}\nactuals: ['%{subject}']\n") == "the section subject is missing"
raise unless read("subject: '%{a}'\nactuals: ['%{subject}']\n") == "the section contexts is missing"
raise unless read("subject: '%{a}'\ncontexts: {a: [1]}\n") == "the section actuals is missing"

# Contexts: a non-empty mapping of names to non-empty lists of code.
raise unless read("subject: x\ncontexts: {}\nactuals: [x]\n") == "contexts must not be empty"
raise unless read("subject: x\ncontexts:\nactuals: [x]\n") == "contexts must be a mapping"
raise unless read("subject: x\ncontexts: [a]\nactuals: [x]\n") == "contexts must be a mapping"
raise unless read("subject: x\ncontexts: {a: 1}\nactuals: [x]\n") == "contexts.a must be a list"
raise unless read("subject: x\ncontexts: {a: []}\nactuals: [x]\n") == "contexts.a must not be empty"
raise unless read("subject: x\ncontexts: {a: [1, '']}\nactuals: [x]\n") == "contexts.a[1] must not be empty"
raise unless read("subject: x\ncontexts: {a: [1, ' ']}\nactuals: [x]\n") == "contexts.a[1] must not be empty"
raise unless read("subject: x\ncontexts: {a: [[1]]}\nactuals: [x]\n") == "contexts.a[0] must be text"
raise unless read("subject: x\ncontexts: {1a: [1]}\nactuals: [x]\n").start_with?('the context "1a" must be named')
raise unless read("subject: x\ncontexts: {a-b: [1]}\nactuals: [x]\n").start_with?('the context "a-b" must be named')
raise unless read("subject: x\ncontexts: {a: [1], a: [2]}\nactuals: [x]\n") == 'contexts has the key "a" twice'
raise unless read("subject: x\ncontexts: {[a]: [1]}\nactuals: [x]\n") == "a key of contexts must be text"
# A key YAML would read as a boolean is a name like any other.
raise unless read("subject: '%{on}'\ncontexts: {on: [1]}\nactuals: [x]\n").contexts.keys == ["on"]

# Actuals: a non-empty list of code.
raise unless read("subject: x\ncontexts: {a: [1]}\nactuals: []\n") == "actuals must not be empty"
raise unless read("subject: x\ncontexts: {a: [1]}\nactuals: x\n") == "actuals must be a list"
raise unless read("subject: x\ncontexts: {a: [1]}\nactuals: [{a: 1}]\n") == "actuals[0] must be text"
raise unless read("subject: x\ncontexts: {a: [1]}\nactuals: [42]\n").actuals == ["42"]

# Code sections: text, not empty.
raise unless read("subject: ''\ncontexts: {a: [1]}\nactuals: [x]\n") == "subject must not be empty"
raise unless read("subject: [x]\ncontexts: {a: [1]}\nactuals: [x]\n") == "subject must be text"
raise unless read("#{valid}header:\n") == "header must not be empty"
raise unless read("#{valid}footer: {a: 1}\n") == "footer must be text"

# No anchors, aliases or tags: what is written is what is read.
raise unless read("subject: &s x\ncontexts: {a: [1]}\nactuals: [x]\n") == "subject must not have an anchor or a tag"
raise unless read("subject: x\ncontexts: &c {a: [1]}\nactuals: [x]\n") == "contexts must not have an anchor or a tag"
raise unless read("subject: x\ncontexts: {a: &l [1]}\nactuals: [x]\n") == "contexts.a must not have an anchor or a tag"
raise unless read("subject: x\ncontexts: {a: [1]}\nactuals: [&i x]\n") == "actuals[0] must not have an anchor or a tag"
raise unless read("subject: !!str x\ncontexts: {a: [1]}\nactuals: [x]\n") == "subject must not have an anchor or a tag"
raise unless read("subject: !ruby/object:Object x\ncontexts: {a: [1]}\nactuals: [x]\n") ==
             "subject must not have an anchor or a tag"
raise unless read("subject: x\ncontexts: {a: [1]}\nactuals: [x]\nfooter: *f\n") == "footer must not be an alias"
raise unless read("subject: &s x\ncontexts: {a: [*s]}\nactuals: [x]\n") == "contexts.a[0] must not be an alias"

# A name may hold dots and dashes, not start with one (a path starting with
# a dash could not be given to the command); it is checked whole, as bytes,
# and a name the file system would refuse (APFS: invalid UTF-8) never
# reaches it.
raise unless read(valid, name: "my.calc-v2_brutal.yaml").subject == "%{a}"
[".x_brutal.yaml", "-x_brutal.yaml", "a\nb_brutal.yaml", "x_brutalxyaml", "a\xFF_brutal.yaml".b].each do |name|
  raise name.dump unless read(nil, name:).start_with?("the file name must be NAME_brutal.yaml")
end

# A byte order mark is skipped; a YAML error gives its line and column.
raise unless read("\xEF\xBB\xBF#{valid}".b).subject == "%{a}"
raise unless read("subject: [\n") == "invalid YAML at line 2, column 1: did not find expected node content"

# The text is read as UTF-8, whatever the locale.
verbose = $VERBOSE
external = Encoding.default_external
begin
  $VERBOSE = nil
  Encoding.default_external = Encoding::US_ASCII
  raise unless read("subject: '\"\u00E9\" + %{a}'\ncontexts: {a: [1]}\nactuals: [x]\n").subject == "\"\u00E9\" + %{a}"
ensure
  Encoding.default_external = external
  $VERBOSE = verbose
end

# A value of several lines must be a literal block: YAML folds the others,
# and a folded line break could join code to a comment.
raise unless read("subject: x;#c\n  y\ncontexts: {a: [1]}\nactuals: [x]\n") ==
             "subject spans several lines: write it as a literal block (|)"
raise unless read("subject: >\n  x\n  y\ncontexts: {a: [1]}\nactuals: [x]\n") ==
             "subject spans several lines: write it as a literal block (|)"
raise unless read("subject: x\ncontexts: {a: [\"a\u0085b\"]}\nactuals: [x]\n") ==
             "contexts.a[0] spans several lines: write it as a literal block (|)"
raise unless read("subject: x\ncontexts: {a: ['a\nb']}\nactuals: [x]\n") ==
             "contexts.a[0] spans several lines: write it as a literal block (|)"
raise unless read("subject: |\n  x\n  y\ncontexts: {a: [\"a\\nb\"]}\nactuals: [x]\n").contexts == { "a" => ["a\nb"] }
