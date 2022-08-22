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

    def self.generated_pathname(pathname)
      filename = pathname.split(separator).fetch(-1)

      if filename == DEFAULT_CONFIG_FILENAME
        directory_parts = pathname.split(separator)[..-2]
        path_parts = directory_parts + [DEFAULT_GENERATED_FILENAME]
        return path_parts.join(separator)
      end

      pathname.gsub(/.[^.]+\z/, ".rb")
    end

    def self.override_protection(pathname)
      return true unless ::File.exist?(pathname)

      abort "A #{pathname} file already exists!"
    end

    def self.separator
      ::File::SEPARATOR
    end
    private_class_method :separator
  end
end
