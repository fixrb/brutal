# frozen_string_literal: true

require_relative 'base'

module Brutal
  module ScaffoldGenerator
    # Plain Old Ruby.
    #
    # @api private
    #
    class Por < Base
      # Return a string representation
      #
      # @return [String]
      #
      # @api public
      def to_s
        names       = variables.keys.sort
        values_arr  = names.map { |name| variables.fetch(name) }

        test_params = Array(values_arr[0]).product(*Array(values_arr[1..-1]))

        blank_line.gsub(/\A\n/, '') +
        "front_object = #{front_object_str}\n" +
        blank_line +
        test_params.map do |values|
          attributes = names.each_with_index.inject(front_object: 'front_object') do |h, (name, i)|
            h.merge(name.to_sym => inspect(values.fetch(i)))
          end

          actual_str = format(inspect(subject), **attributes)

          string = "actual = #{actual_str}\n\n"
          actual = eval(actual_str) # rubocop:disable Security/Eval, Lint/UselessAssignment

          actual_values.each do |actual_value|
            result_str = format(actual_value, subject: 'actual')
            string += "raise unless #{result_str} == #{eval(result_str).inspect}\n" # rubocop:disable Security/Eval
          end

          string
        end.join(blank_line)
      end

      def blank_line
        "\n"                \
        "# #{('-' * 78)}\n" \
        "\n"
      end
    end
  end
end
