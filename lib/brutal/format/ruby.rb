# frozen_string_literal: true

require_relative File.join("ruby", "filename")

class Brutal
  module Format
    # Ruby format class
    class Ruby
      # Whitespace character.
      SPACE = " "

      # Hyphen-minus character.
      HYPHEN_MINUS = "-"

      # Two spaces per indentation level.
      INDENTATION = SPACE * 2

      # Specifies templates to challenge evaluated subjects & get results.
      attr_reader :actuals

      # Specifies a list of variables to populate the subject's template.
      attr_reader :contexts

      # Specifies a block of lines to be executed once before all examples.
      attr_reader :header

      # Specifies a block of lines to be executed before each example.
      attr_reader :before

      # Specifies the template of the code to be declined across contexts.
      attr_reader :subject

      # Specifies a block of lines to be executed after each example.
      attr_reader :after

      # Specifies a block of lines to be executed once after all examples.
      attr_reader :footer

      # Initialize a new scaffold generator.
      def initialize(header, before, subject, after, footer, *actuals, **contexts)
        header = "# Brutal test suite"      if header.empty?
        before = "# Starting an example"    if before.empty?
        after  = "# Finishing an example"   if after.empty?
        footer = "# End of the brutal test" if footer.empty?

        warn("Empty subject!")              if subject.empty?
        warn("Empty actual values!")        if actuals.empty?
        warn("Empty contexts!")             if contexts.empty?

        @header   = header
        @before   = before
        @subject  = subject
        @actuals  = actuals
        @contexts = contexts
        @after    = after
        @footer   = footer
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
        eval(header) # rubocop:disable Security/Eval

        ruby_lines.compact.join(separator_code)
      ensure
        eval(footer) # rubocop:disable Security/Eval
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
        [header_code] + actual_codes + [footer_code]
      end

      def actual_codes
        combinations_values.map do |values|
          actual_str = format(inspect(subject), **attributes(*values))
          string = actual_code(actual_str)
          actual = eval(actual_str) # rubocop:disable Security/Eval, Lint/UselessAssignment

          actuals.each do |actual_value|
            result_str = format(actual_value, subject: "actual")
            string += "raise if #{result_str} != #{eval(result_str).inspect}\n" # rubocop:disable Security/Eval
          end

          string
        end
      end

      def actual_code(actual_str)
        <<~CODE
          #{before_code}
          actual = begin
          #{actual_str.gsub(/^/, INDENTATION)}
          end

          #{after_code}
        CODE
      end

      def header_code
        <<~CODE
          #{header.chomp}
        CODE
      end

      def before_code
        <<~CODE
          #{before.chomp}
        CODE
      end

      def after_code
        <<~CODE
          #{after.chomp}
        CODE
      end

      def footer_code
        <<~CODE
          #{footer.chomp}
        CODE
      end

      def separator_code
        <<~CODE

          #{thematic_break_code}
        CODE
      end

      def thematic_break_code
        <<~CODE
          # #{HYPHEN_MINUS * 78}
        CODE
      end
    end
  end
end
