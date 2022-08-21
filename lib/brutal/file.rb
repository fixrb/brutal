# frozen_string_literal: true

%w[
  read
  write
].each { |filename| require_relative(File.join("file", filename)) }

module Brutal
  # Brutal::File
  module File
    DEFAULT_CONFIG_FILENAME = ".brutal.yml"
    DEFAULT_GENERATED_FILENAME = "test.rb"

    def self.generated_filename(filename)
      return DEFAULT_GENERATED_FILENAME if filename == DEFAULT_CONFIG_FILENAME

      filename.gsub(/.[^.]+\z/, ".rb")
    end
  end
end
