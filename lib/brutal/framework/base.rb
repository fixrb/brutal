module Brutal
  module Framework
    class Base
      attr_reader :subject, :challenges, :variables

      def initialize(subject, *challenges, **variables)
        @subject    = subject
        @challenges = challenges
        @variables  = variables
      end

      def to_s
        raise ::NotImplementedError
      end
    end
  end
end
