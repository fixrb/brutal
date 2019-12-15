require_relative 'base'

module Brutal
  module Framework
    class Poro < Base
      def to_s
        names       = variables.keys.sort
        values_arr  = names.map { |name| variables.fetch(name) }
        test_params = Array(values_arr[0]).product(*Array(values_arr[1..-1]))

        test_params.inject('') do |scaffold, values|
          attributes = names.each_with_index.inject({}) do |h, (name, i)|
            h.merge(name.to_sym => values.fetch(i))
          end

          populated_subject = subject % attributes
          result = eval(populated_subject)

          scaffold += "\n# " + ('-' * 78) + "\n\nresult = #{populated_subject}\n"

          challenges.each do |challenge|
            value = "result#{challenge}"
            scaffold += "raise unless #{value} == #{eval(value).inspect}\n"
          end

          scaffold
        end
      end
    end
  end
end
