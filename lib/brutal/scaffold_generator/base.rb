# frozen_string_literal: true

module Brutal
  module ScaffoldGenerator
    # Base class
    class Base
      # @api private
      attr_reader :front_object_str, :front_object, :subject, :actual_values, :variables

      # Initialize a new scaffold generator
      def initialize(front_object, subject, *actual_values, **variables)
        raise 'Empty actual values!'  if actual_values.empty?
        raise 'Empty variables!'      if variables.empty?

        @front_object_str = inspect(front_object)
        @front_object     = eval(@front_object_str) # rubocop:disable Security/Eval
        @subject          = subject
        @actual_values    = actual_values
        @variables        = variables
      end

      # Return a Ruby string that can be evaluated.
      def inspect(object)
        return object.to_s unless object.is_a?(::String)

        object.strip
      end
    end
  end
end
