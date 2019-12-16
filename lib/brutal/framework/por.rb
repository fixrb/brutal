require_relative 'base'

module Brutal
  module Framework
    # Plain Old Ruby
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

        test_params.inject('') do |string, values|
          attributes = names.each_with_index.inject({}) do |h, (name, i)|
            h.merge(name.to_sym => values.fetch(i))
          end

          actual_str = subject % attributes

          string += "\n"                \
                    "# #{('-' * 78)}\n" \
                    "\n"                \
                    "actual = #{actual_str}\n"

          actual = eval(actual_str)

          challenges.each do |challenge|
            result  = challenge % { actual: 'actual' }
            string += "raise unless #{result} == #{eval(result).inspect}\n"
          end

          string
        end
      end
    end
  end
end
