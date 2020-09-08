# frozen_string_literal: true

module Brutal
  # Brutal::Configuration
  #
  # @since 1.0.0
  class Configuration
    DEFAULT_HEAD      = '# Brutal test suite'
    DEFAULT_SUBJECT   = ''
    DEFAULT_CONTEXTS  = {}.freeze
    DEFAULT_ACTUALS   = [].freeze

    # Load the configuration parameters.
    #
    # @param hash [Hash] Receive the 4 top-level section parameters.
    def self.load(params)
      new(
        header: params.fetch('header', DEFAULT_HEAD),
        subject: params.fetch('subject', DEFAULT_SUBJECT),
        contexts: params.fetch('contexts', DEFAULT_CONTEXTS),
        actuals: params.fetch('actuals', DEFAULT_ACTUALS)
      )
    end

    attr_reader(:actuals, :contexts, :header, :subject)

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
