module Brutal
  module Framework
    class Base
      # @api private
      attr_reader :subject, :challenges, :variables

      # Initialize a new framework
      def initialize(subject, *challenges, **variables)
        @subject    = subject
        @challenges = challenges
        @variables  = variables
      end

      # Return a string representation
      #
      # @api private
      def to_s
        raise ::NotImplementedError
      end
    end
  end
end
