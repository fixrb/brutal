# frozen_string_literal: true

%w[
  configuration
  file
  format
  yaml
].each { |filename| require_relative(File.join("brutal", filename)) }

# The Brutal namespace.
class Brutal
  attr_reader :format

  def initialize(format: Format::DEFAULT)
    @format = String(format)
  end

  def call(pathname)
    hash = parse(pathname)
    conf = Configuration.load(hash)
    code = scaffold(conf)
    write(pathname, code)
  end

  def scaffold(conf)
    engine = Format::SUPPORT.fetch(format) do
      raise ::NotImplementedError, "#{format.inspect} format is not supported."
    end

    engine.new(conf.header, conf.subject, *conf.actuals, **conf.contexts)
  end

  private

  def parse(pathname)
    return Yaml.parse(read(pathname)) if Yaml.parse?(pathname)

    raise ::ArgumentError, "Unrecognized extension.  " \
                           "Impossible to parse #{pathname.inspect}."
  end

  def read(pathname)
    File::Read.new(pathname).call
  end

  def write(pathname, ruby)
    new_pathname = File.generated_pathname(pathname)
    File::Write.new(new_pathname).call(ruby)
  end
end
