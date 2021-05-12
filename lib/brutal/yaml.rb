# frozen_string_literal: true

require "yaml"

module Brutal
  # Brutal::Yaml
  #
  # @since 1.1.0
  module Yaml
    def self.parse(yaml)
      ::YAML.safe_load(yaml, symbolize_names: false)
    end
  end
end
