# frozen_string_literal: true

require 'yaml'

module Brutal
  # Brutal::Configuration
  #
  # @since 1.0.0
  class Configuration
    NAME = '.brutal.yml'
    PATH = ::File.join(::Dir.pwd, NAME).freeze
    DEFAULT_HEADER = '# Brutal test suite'

    def self.load!
      new.to_a
    end

    def self.file!
      ::YAML.safe_load(File.read(PATH), symbolize_names: true)
    rescue ::Errno::ENOENT => _e
      abort("File #{PATH} not found!")
    end

    attr_reader(:header, :subject, :contexts, :actuals)

    # rubocop:disable Metrics/AbcSize
    def initialize
      settings = self.class.file!

      @header   = settings.fetch(:header,   DEFAULT_HEADER)
      @subject  = settings.fetch(:subject,  '')
      @contexts = settings.fetch(:contexts, {})
      @actuals  = settings.fetch(:actuals,  [])

      raise ::TypeError, @header.inspect   unless @header.is_a?(::String)
      raise ::TypeError, @subject.inspect  unless @subject.is_a?(::String)
      raise ::TypeError, @contexts.inspect unless @contexts.is_a?(::Hash)
      raise ::TypeError, @actuals.inspect  unless @actuals.is_a?(::Array)
    end
    # rubocop:enable Metrics/AbcSize

    def to_a
      [header, subject, *actuals, **contexts]
    end
  end
end
