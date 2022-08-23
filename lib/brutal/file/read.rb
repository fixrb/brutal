# frozen_string_literal: true

module Brutal
  module File
    # Brutal::File::Read
    #
    # @since 1.1.0
    class Read
      attr_reader :name

      def initialize(name)
        @name = name
      end

      def call
        ::File.read(path)
      rescue ::Errno::ENOENT => _e
        abort "File #{path} not found!"
      end

      protected

      def path
        ::File.join(::Dir.pwd, name)
      end
    end
  end
end
