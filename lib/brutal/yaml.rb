# frozen_string_literal: true

require "yaml"

class Brutal
  # Brutal::Yaml
  module Yaml
    FILENAME_EXTENSION = ".yaml"

    def self.parse(yaml)
      ::YAML.safe_load(yaml, symbolize_names: false)
    end

    def self.parse?(pathname)
      filename_extension = pathname.extname
      filename_extension.eql?(FILENAME_EXTENSION)
    end
  end
end
