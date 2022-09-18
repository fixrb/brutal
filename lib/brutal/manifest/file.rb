# frozen_string_literal: true

require_relative File.join("file", "name")

require "yaml"

class Brutal
  class Manifest
    # YAML manifest file parser.
    class File
      attr_reader :yaml

      def initialize(pathname)
        unless pathname.fnmatch?(Name::SUFFIX_PATTERN, ::File::FNM_PATHNAME | ::File::FNM_DOTMATCH)
          raise ::ArgumentError
        end

        @yaml = pathname.read
      end

      def parse
        ::YAML.safe_load(yaml, symbolize_names: false)
      end
    end
  end
end
