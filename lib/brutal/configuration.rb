# frozen_string_literal: true

module Brutal
  # Brutal::Configuration
  #
  # @since 1.0.0
  class Configuration
    HEAD = '# Brutal test suite'

    # Load the configuration parameters.
    #
    # @param hash [Hash] Receive the 4 top-level section parameters.
    def self.load(params)
      new(
        header:   params.fetch('header',    HEAD),
        subject:  params.fetch('subject',   ''),
        contexts: params.fetch('contexts',  {}),
        actuals:  params.fetch('actuals',   [])
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
