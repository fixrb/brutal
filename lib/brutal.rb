# frozen_string_literal: true

%w[
  configuration
  file/read
  file/write
  scaffold
  yaml
].each { |file_name| require_relative(File.join('brutal', file_name)) }

# The Brutal namespace.
module Brutal
  def self.generate!
    yaml = File::Read.new.call
    hash = Yaml.parse(yaml)
    conf = Configuration.load(hash)
    ruby = Scaffold.new(conf.header,
                        conf.subject,
                        *conf.actuals,
                        **conf.contexts)

    File::Write.new.call(ruby)
  end
end
