# frozen_string_literal: true

class Brutal
  module File
    # Brutal::File::Write
    #
    # @since 1.1.0
    class Write
      attr_reader :name

      def initialize(name)
        @name = name
      end

      def call(scaffold)
        file = ::File.open(path, "w")
        file.write(scaffold)

        true
      ensure
        file.close
      end

      protected

      def path
        ::File.join(::Dir.pwd, name)
      end
    end
  end
end
