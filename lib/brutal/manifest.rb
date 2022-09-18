# frozen_string_literal: true

require_relative File.join("manifest", "file")

class Brutal
  # Brutal YAML manifest file parser.
  class Manifest
    # The _actuals_ top-level section key.
    ACTUALS_KEY = "actuals"

    # The _contexts_ top-level section key.
    CONTEXTS_KEY = "contexts"

    # The _header_ top-level section key.
    HEADER_KEY = "header"

    # The _before_ top-level section key.
    BEFORE_KEY = "before"

    # The _subject_ top-level section key.
    SUBJECT_KEY = "subject"

    # The _after_ top-level section key.
    AFTER_KEY = "after"

    # The _footer_ top-level section key.
    FOOTER_KEY = "footer"

    # Default _actuals_ collection.
    DEFAULT_ACTUALS = [].freeze

    # Default _contexts_ collection.
    DEFAULT_CONTEXTS = {}.freeze

    # Default _header_ code to evaluate.
    DEFAULT_HEADER = ""

    # Default _before_ code to evaluate.
    DEFAULT_BEFORE = ""

    # Default _after_ code to evaluate.
    DEFAULT_AFTER = ""

    # Default _footer_ code to evaluate.
    DEFAULT_FOOTER = ""

    # Parse a file at `pathname`.  Returns the YAML manifest instance.
    def self.parse_file(pathname)
      load(File.new(pathname).parse)
    end

    # Load the configuration parameters.
    #
    # @param params [Hash] Receive the 7 top-level section parameters.
    def self.load(params)
      new(
        actuals:  params.fetch(ACTUALS_KEY, DEFAULT_ACTUALS),
        contexts: params.fetch(CONTEXTS_KEY, DEFAULT_CONTEXTS),
        header:   params.fetch(HEADER_KEY, DEFAULT_HEADER),
        before:   params.fetch(BEFORE_KEY, DEFAULT_BEFORE),
        subject:  params.fetch(SUBJECT_KEY),
        after:    params.fetch(AFTER_KEY, DEFAULT_AFTER),
        footer:   params.fetch(FOOTER_KEY, DEFAULT_FOOTER)
      )
    end

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

    # Initialize a new configuration.
    def initialize(actuals:, contexts:, header:, before:, subject:, after:, footer:)
      raise ::TypeError, actuals.inspect  unless actuals.is_a?(::Array)
      raise ::TypeError, contexts.inspect unless contexts.is_a?(::Hash)
      raise ::TypeError, header.inspect   unless header.is_a?(::String)
      raise ::TypeError, before.inspect   unless before.is_a?(::String)
      raise ::TypeError, subject.inspect  unless subject.is_a?(::String)
      raise ::TypeError, after.inspect    unless after.is_a?(::String)
      raise ::TypeError, footer.inspect   unless footer.is_a?(::String)

      @actuals  = actuals
      @contexts = contexts
      @header   = header
      @before   = before
      @subject  = subject
      @after    = after
      @footer   = footer
    end
  end
end
