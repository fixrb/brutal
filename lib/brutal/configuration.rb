# frozen_string_literal: true

module Brutal
  # Brutal::Configuration
  #
  # @since 1.0.0
  class Configuration
    HEAD = '# Brutal test suite'

    attr_reader(:actuals, :contexts, :header, :subject)

    def initialize(actuals: [], contexts: {}, header: HEAD, subject: '')
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
