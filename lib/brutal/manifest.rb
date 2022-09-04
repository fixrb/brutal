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

    # The _subject_ top-level section key.
    SUBJECT_KEY = "subject"

    # Default _actuals_ collection.
    DEFAULT_ACTUALS = [].freeze

    # Default _contexts_ collection.
    DEFAULT_CONTEXTS = {}.freeze

    # Default _header_ code to evaluate.
    DEFAULT_HEADER = "# Brutal test suite"

    # Parse a file at `pathname`.  Returns the YAML manifest instance.
    def self.parse_file(pathname)
      load(File.new(pathname).parse)
    end

    # Load the configuration parameters.
    #
    # @param params [Hash] Receive the 4 top-level section parameters.
    def self.load(params)
      new(
        actuals:  params.fetch(ACTUALS_KEY, DEFAULT_ACTUALS),
        contexts: params.fetch(CONTEXTS_KEY, DEFAULT_CONTEXTS),
        header:   params.fetch(HEADER_KEY, DEFAULT_HEADER),
        subject:  params.fetch(SUBJECT_KEY)
      )
    end

    # Specifies templates to challenge evaluated subjects & get results.
    attr_reader :actuals

    # Specifies a list of variables to populate the subject's template.
    attr_reader :contexts

    # Specifies the code to execute before generating the test suite.
    attr_reader :header

    # Specifies the template of the code to be declined across contexts.
    attr_reader :subject

    # Initialize a new configuration.
    def initialize(actuals:, contexts:, header:, subject:)
      raise ::TypeError, actuals.inspect  unless actuals.is_a?(::Array)
      raise ::TypeError, contexts.inspect unless contexts.is_a?(::Hash)
      raise ::TypeError, header.inspect   unless header.is_a?(::String)
      raise ::TypeError, subject.inspect  unless subject.is_a?(::String)

      @actuals  = actuals
      @contexts = contexts
      @header   = header
      @subject  = subject
    end
  end
end
