# frozen_string_literal: true

require "yaml"

module Brutal
  # Brutal::Yaml
  #
  # @since 1.1.0
  module Yaml
    FILENAME_EXTENSIONS = %w[
      .yaml
      .yml
    ].freeze

    def self.parse(yaml)
      ::YAML.safe_load(yaml, symbolize_names: false)
    end

    def self.parse?(pathname)
      filename_extension = pathname.extname
      FILENAME_EXTENSIONS.include?(filename_extension)
    end
  end
end
