# frozen_string_literal: true

module Brutal
  # Brutal::Scaffold
  #
  # @since 1.0.0
  class Scaffold
    # Specifies templates to challenge evaluated subjects & get results.
    attr_reader :actuals

    # Specifies a list of variables to populate the subject's template.
    attr_reader :contexts

    # Specifies the code to execute before generating the test suite.
    attr_reader :header

    # Specifies the template of the code to be declined across contexts.
    attr_reader :subject

    # Initialize a new scaffold generator.
    def initialize(header, subject, *actuals, **contexts)
      warn("Empty subject!")        if subject.empty?
      warn("Empty actual values!")  if actuals.empty?
      warn("Empty contexts!")       if contexts.empty?

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

    # Return a string representation.
    #
    # @return [String]
    def to_s
      ruby_lines.join(separator_ruby_code)
    end

    def attributes(*values)
      context_names.each_with_index.inject({}) do |h, (name, i)|
        h.merge(name.to_sym => inspect(values.fetch(i)))
      end
    end

    def context_names
      contexts.keys.sort
    end

    def contexts_values
      context_names.map { |context_name| contexts.fetch(context_name) }
    end

    def combinations_values
      Array(contexts_values[0]).product(*Array(contexts_values[1..]))
    end

    def ruby_lines
      [header_ruby_code] + actual_ruby_codes
    end

    def actual_ruby_codes
      combinations_values.map do |values|
        actual_str = format(inspect(subject), **attributes(*values))
        string = actual_ruby_code(actual_str)
        actual = eval(actual_str) # rubocop:disable Security/Eval, Lint/UselessAssignment

        actuals.each do |actual_value|
          result_str = format(actual_value, subject: "actual")
          string += "raise if #{result_str} != #{eval(result_str).inspect}\n" # rubocop:disable Security/Eval
        end

        string
      end
    end

    def actual_ruby_code(actual_str)
      <<~RUBY_CODE
        actual = begin
        #{actual_str.gsub(/^/, '  ')}
        end

      RUBY_CODE
    end

    def header_ruby_code
      <<~RUBY_CODE
        #{header.chomp}
      RUBY_CODE
    end

    def separator_ruby_code
      <<~RUBY_CODE

        #{thematic_break_ruby_code}
      RUBY_CODE
    end

    def thematic_break_ruby_code
      <<~RUBY_CODE
        # #{'-' * 78}
      RUBY_CODE
    end
  end
end
