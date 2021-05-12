# frozen_string_literal: true

module Brutal
  # Brutal::File
  #
  # @since 1.1.0
  module File
    # Brutal::File::Read
    #
    # @since 1.1.0
    class Read
      NAME = ".brutal.yml"

      attr_reader :name

      def initialize(name = NAME)
        @name = name
      end

      def call
        ::File.read(path)
      rescue ::Errno::ENOENT => _e
        abort("File #{path} not found!")
      end

      protected

      def path
        ::File.join(::Dir.pwd, name)
      end
    end
  end
end
