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
    RUBY_EXTENSION = ".rb"

    def self.generated_pathname(pathname)
      filename = pathname.basename
      return pathname.dirname + DEFAULT_GENERATED_FILENAME if default_config_filename?(filename)

      pathname.sub_ext(RUBY_EXTENSION)
    end

    def self.override_protection(pathname)
      abort "A #{pathname} file already exists!" if pathname.exist?
    end

    def self.default_config_filename?(filename)
      filename.to_s == DEFAULT_CONFIG_FILENAME
    end
    private_class_method :default_config_filename?
  end
end
