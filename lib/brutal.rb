# frozen_string_literal: true

%w[
  configuration
  file
  scaffold
  yaml
].each { |filename| require_relative(File.join("brutal", filename)) }

# The Brutal namespace.
module Brutal
  def self.generate!(pathname, force: true)
    hash = parse(pathname)
    conf = Configuration.load(hash)

    ruby = Scaffold.new(conf.header,
                        conf.subject,
                        *conf.actuals,
                        **conf.contexts)

    write(pathname, ruby, force: force)
  end

  def self.parse(pathname)
    return Yaml.parse(read(pathname)) if Yaml.parse?(pathname)

    raise ::ArgumentError, "Unrecognized extension.  " \
                           "Impossible to parse #{pathname.inspect}."
  end
  private_class_method :parse

  def self.read(pathname)
    File::Read.new(pathname).call
  end
  private_class_method :read

  def self.write(pathname, ruby, force:)
    new_pathname = File.generated_pathname(pathname)
    File.override_protection(new_pathname) unless force
    File::Write.new(new_pathname).call(ruby)
  end
  private_class_method :write
end
