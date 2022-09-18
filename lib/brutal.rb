# frozen_string_literal: true

%w[
  format
  manifest
].each { |filename| require_relative(File.join("brutal", filename)) }

# The Brutal namespace.
class Brutal
  attr_reader :engine

  def initialize(format)
    @engine = Format.const_get(format)
  end

  def call(pathname)
    manifest = Manifest.parse_file(pathname)
    scaffold = brutalizer(manifest)
    pathname = new_pathname(pathname)
    pathname.write(scaffold)
  end

  private

  def brutalizer(conf)
    engine.new(conf.header, conf.before, conf.subject, conf.after, conf.footer, *conf.actuals, **conf.contexts)
  end

  def new_pathname(pathname)
    pathname.dirname + "#{new_prefix}#{pathname.basename.sub(Manifest::File::Name::SUFFIX_REGEX, new_suffix)}"
  end

  def new_prefix
    engine.const_get(:Filename).const_get(:PREFIX)
  end

  def new_suffix
    engine.const_get(:Filename).const_get(:SUFFIX)
  end
end
