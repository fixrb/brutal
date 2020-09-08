# frozen_string_literal: true

module Brutal
  # Brutal::Configuration
  #
  # @since 1.0.0
  class Configuration
    DEFAULT_ACTUALS   = [].freeze
    DEFAULT_CONTEXTS  = {}.freeze
    DEFAULT_HEAD      = '# Brutal test suite'
    DEFAULT_SUBJECT   = ''

    # Load the configuration parameters.
    #
    # @param params [Hash] Receive the 4 top-level section parameters.
    def self.load(params)
      new(
        actuals: params.fetch('actuals', DEFAULT_ACTUALS),
        contexts: params.fetch('contexts', DEFAULT_CONTEXTS),
        header: params.fetch('header', DEFAULT_HEAD),
        subject: params.fetch('subject', DEFAULT_SUBJECT)
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
