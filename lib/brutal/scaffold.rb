# frozen_string_literal: true

module Brutal
  # Brutal::Scaffold
  #
  # @since 1.0.0
  class Scaffold
    attr_reader(:header, :subject, :actuals, :contexts)

    # Initialize a new scaffold generator
    def initialize(header, subject, *actuals, **contexts)
      warn('Empty subject!')        if subject.empty?
      warn('Empty actual values!')  if actuals.empty?
      warn('Empty contexts!')       if contexts.empty?

      eval(header) # rubocop:disable Security/Eval

      @header   = header
      @subject  = subject
      @actuals  = actuals
      @contexts = contexts
    end

    # Return a Ruby string that can be evaluated.
    def inspect(object)
      return object.to_s unless object.is_a?(::String)

      object.strip
    end

    # Return a string representation
    #
    # @return [String]
    #
    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def to_s
      header.chomp + "\n" + blank_line + combinations_values.map do |values|
        attributes = context_names.each_with_index.inject({}) do |h, (name, i)|
          h.merge(name.to_sym => inspect(values.fetch(i)))
        end

        actual_str = format(inspect(subject), **attributes)

        string = <<~CODE
          actual = begin
          #{actual_str.gsub(/^/, '  ')}
          end

        CODE

        actual = eval(actual_str) # rubocop:disable Security/Eval, Lint/UselessAssignment

        actuals.each do |actual_value|
          result_str = format(actual_value, subject: 'actual')
          string += "raise if #{result_str} != #{eval(result_str).inspect}\n" # rubocop:disable Security/Eval
        end

        string
      end.join(blank_line)
    end
    # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

    def blank_line
      "\n"                \
      "# #{('-' * 78)}\n" \
      "\n"
    end

    def context_names
      contexts.keys.sort
    end

    def contexts_values
      context_names.map { |context_name| contexts.fetch(context_name) }
    end

    def combinations_values
      Array(contexts_values[0]).product(*Array(contexts_values[1..-1]))
    end
  end
end
