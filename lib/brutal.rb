# frozen_string_literal: true

%w[
  configuration
  file
  scaffold
  yaml
].each { |filename| require_relative(File.join("brutal", filename)) }

# The Brutal namespace.
module Brutal
  def self.generate!(filename)
    file = File::Read.new(filename).call

    hash = if Yaml.parse?(filename)
             Yaml.parse(file)
           else
             raise ::ArgumentError, "Unrecognized extension.  " \
                                    "Impossible to parse #{filename.inspect}."
           end

    conf = Configuration.load(hash)

    ruby = Scaffold.new(conf.header,
                        conf.subject,
                        *conf.actuals,
                        **conf.contexts)

    new_filename = File.generated_filename(filename)

    File::Write.new(new_filename).call(ruby)
  end
end
