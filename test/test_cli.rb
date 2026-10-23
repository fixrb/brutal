# frozen_string_literal: true

require_relative File.join("support", "coverage")
require_relative File.join("..", "lib", "brutal")
require_relative File.join("support", "project")

valid = "subject: '%{a} + 1'\ncontexts: {a: [1]}\nactuals: ['%{subject}']\n"

# Help, and usage errors, which run nothing.
status, out, err = brutal("--help")
raise unless status.zero? && out == Brutal::CLI::USAGE && err.empty?
raise unless brutal("-h", "missing")[0].zero?
status, out, err = brutal
raise unless status == 2 && out.empty? && err == "brutal: no path given\n\n#{Brutal::CLI::USAGE}"
status, _, err = brutal("--format=ruby", "--help")
raise unless status == 2 && err.start_with?("brutal: unknown option --format=ruby\n")
raise unless brutal("--check")[0] == 2

# Each manifest given, or found under a directory given, gets its test file.
directory = project(
  "a_brutal.yaml"           => valid,
  "spec/b_brutal.yaml"      => valid,
  "spec/deep/c_brutal.yaml" => valid,
  ".hidden/d_brutal.yaml"   => valid,
  "spec/notes.yaml"         => valid
)
status, out, err = brutal(directory)
raise unless [status, out, err] == [0, "", ""]
written = Dir.glob("**/test_*.rb", base: directory, flags: File::FNM_DOTMATCH).sort
raise unless written == ["spec/deep/test_c.rb", "spec/test_b.rb", "test_a.rb"]
raise unless passes?(File.join(directory, "spec", "deep", "test_c.rb"))

# --check writes nothing, and fails on a test file missing or out of date.
raise unless brutal("--check", directory)[0].zero?
File.write(File.join(directory, "spec", "b_brutal.yaml"), valid.sub("[1]", "[2]"))
File.delete(File.join(directory, "test_a.rb"))
status, out, err = brutal("--check", directory)
raise unless status == 1 && out.empty?
raise unless err == "brutal: #{directory}/a_brutal.yaml: #{directory}/test_a.rb is missing\n" \
                    "brutal: #{directory}/spec/b_brutal.yaml: #{directory}/spec/test_b.rb is not up to date\n"
raise if File.exist?(File.join(directory, "test_a.rb"))
raise unless brutal(directory)[0].zero? && brutal("--check", directory)[0].zero?

# A manifest given twice, or under two paths, runs once; the code's output
# shows once, the test file's run being silent.
counted = project("x_brutal.yaml" => "header: $stdout.puts(:ran)\n#{valid}")
manifest_path = File.join(counted, "x_brutal.yaml")
log = File.join(counted, "log")
File.open(log, "w") do |file|
  stdout = $stdout
  $stdout = file
  brutal(manifest_path, counted, File.join(counted, ".", "x_brutal.yaml"))
ensure
  $stdout = stdout
end
raise unless File.read(log) == "ran\n"

# A manifest that fails is reported with its path; the others still run,
# and the command fails. A test file in place is left as it was.
broken = project(
  "a_brutal.yaml" => valid,
  "b_brutal.yaml" => valid,
  "c_brutal.yaml" => valid
)
raise unless brutal(broken)[0].zero?
File.write(File.join(broken, "b_brutal.yaml"), "subject: '1 / %{a}'\ncontexts: {a: [0]}\nactuals: ['%{subject}']\n")
File.write(File.join(broken, "c_brutal.yaml"), valid.sub("[1]", "[3]"))
before = File.read(File.join(broken, "test_b.rb"))
status, out, err = brutal(broken)
raise unless status == 1 && out.empty?
raise unless err == "brutal: #{broken}/b_brutal.yaml: a = 0: ZeroDivisionError: divided by 0\n"
raise unless File.read(File.join(broken, "test_b.rb")) == before
raise unless File.read(File.join(broken, "test_c.rb")).include?("(4).eql?((")

# Paths that designate no manifest.
empty = project("notes.yaml" => valid)
status, _, err = brutal(empty, File.join(empty, "missing"), File.join(empty, "notes.yaml"))
raise unless status == 1
raise unless err == "brutal: #{empty}: no manifest found\n" \
                    "brutal: #{empty}/missing: no such file or directory\n" \
                    "brutal: #{empty}/notes.yaml: the file name must be NAME_brutal.yaml, " \
                    "NAME made of ASCII letters, digits, \".\", \"_\" and \"-\", not starting with \".\" or \"-\"\n"

# A test file written by hand is never replaced, and --check says so too.
hand = project("x_brutal.yaml" => valid, "test_x.rb" => "# Mine.\n")
refused = "brutal: #{hand}/x_brutal.yaml: #{hand}/test_x.rb was not written by brutal 2 " \
          "(delete it once if brutal 1 wrote it)\n"
raise unless brutal(hand) == [1, "", refused]
raise unless brutal("--check", hand) == [1, "", refused]
raise unless File.read(File.join(hand, "test_x.rb")) == "# Mine.\n"

# A test file that cannot be written.
blocked = project("x_brutal.yaml" => valid, ".test_x.rb.#{Process.pid}.tmp" => "")
status, _, err = brutal(blocked)
raise unless status == 1 && err == "brutal: #{blocked}/x_brutal.yaml: File exists @ rb_sysopen - " \
                                   "#{blocked}/.test_x.rb.#{Process.pid}.tmp\n"

# The first unknown option is named; a path that designates no manifest
# fails the command, alone or not.
raise unless brutal("--a", "--b", "x")[2].start_with?("brutal: unknown option --a\n")
fine = project("x_brutal.yaml" => valid)
raise unless brutal(fine, File.join(fine, "missing"))[0] == 1
raise unless brutal(project({}))[0] == 1
status, _, err = brutal(File::NULL)
raise unless status == 1 && err == "brutal: #{File::NULL}: no manifest found\n"

# A directory is searched for regular files: hidden files and directories,
# symbolic links to directories, and anything but a file are left out (a
# link to a manifest is a manifest of its own name); a directory that cannot
# be read is an error.
tree = project(
  "a_brutal.yaml"                 => valid,
  "sub_brutal.yaml/b_brutal.yaml" => valid,
  ".c_brutal.yaml"                => valid,
  "real/d_brutal.yaml"            => valid
)
File.symlink(File.join(tree, "real"), File.join(tree, "linked"))
File.symlink(File.join(tree, "a_brutal.yaml"), File.join(tree, "e_brutal.yaml"))
system("mkfifo", File.join(tree, "f_brutal.yaml"), exception: true)
raise unless brutal(tree)[0].zero?
written = Dir.glob("**/test_*.rb", base: tree, flags: File::FNM_DOTMATCH).sort
raise unless written == ["real/test_d.rb", "sub_brutal.yaml/test_b.rb", "test_a.rb", "test_e.rb"]
locked = File.join(tree, "real")
children = Dir.method(:children)
Dir.singleton_class.prepend(Module.new do
  define_method(:children) do |path, **options|
    raise Errno::EACCES, path if path == locked

    super(path, **options)
  end
end)
begin
  status, _, err = brutal(tree)
  raise unless status == 1 && err == "brutal: #{tree}: Permission denied - #{locked}\n"
  raise unless children.call(locked).sort == ["d_brutal.yaml", "test_d.rb"]
ensure
  # Unlocked whatever happened: the directories are removed through
  # Dir.children when the test ends.
  locked = nil
end

# A manifest reached through a symbolic link to its directory runs once.
raise unless brutal(File.join(tree, "real"), File.join(tree, "linked", "d_brutal.yaml"))[0].zero?

# The executable runs the command.
executable = File.join(__dir__, "..", "bin", "brutal")
raise unless system(RbConfig.ruby, executable, "--help", out: File::NULL)
raise unless system(RbConfig.ruby, executable, File.join(project("x_brutal.yaml" => valid), "x_brutal.yaml"))
raise if system(RbConfig.ruby, executable, err: File::NULL)

# Interrupted, the command kills the child, writes nothing, and ends by the
# signal, as an interrupted command does.
slow = project("x_brutal.yaml" => "header: $stdout.puts(:started); $stdout.flush\nsubject: 'sleep %{a}'\n" \
                                  "contexts: {a: [30]}\nactuals: ['%{subject}']\n")
reader, writer = IO.pipe
pid = spawn(RbConfig.ruby, executable, slow, out: writer, err: File::NULL)
writer.close
raise unless reader.gets == "started\n"
Process.kill(:INT, pid)
_, status = Process.wait2(pid)
raise unless status.signaled? && status.termsig == Signal.list.fetch("INT")
raise if File.exist?(File.join(slow, "test_x.rb"))

# Terminated, it ends by that signal.
reader, writer = IO.pipe
pid = spawn(RbConfig.ruby, executable, slow, out: writer, err: File::NULL)
writer.close
raise unless reader.gets == "started\n"
Process.kill(:TERM, pid)
_, status = Process.wait2(pid)
raise unless status.signaled? && status.termsig == Signal.list.fetch("TERM")
