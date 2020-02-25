# frozen_string_literal: true

require 'yaml'

module Brutal
  # Brutal::Configuration
  #
  # @since 1.0.0
  class Configuration
    NAME = '.brutal.yml'
    PATH = ::File.join(::Dir.pwd, NAME).freeze

    def self.load!
      new.call
    end

    def initialize
      @settings = ::YAML.load_file(PATH)
    rescue ::Errno::ENOENT => _e
      abort "File #{PATH} not found!"
    end

    def call
      header    = @settings.fetch('header',   '# Brutal test suite')
      subject   = @settings.fetch('subject',  '')
      contexts  = @settings.fetch('contexts', {})
      actuals   = @settings.fetch('actuals',  [])

      raise ::TypeError, header.inspect   unless header.is_a?(::String)
      raise ::TypeError, subject.inspect  unless subject.is_a?(::String)
      raise ::TypeError, contexts.inspect unless contexts.is_a?(::Hash)
      raise ::TypeError, actuals.inspect  unless actuals.is_a?(::Array)

      [header, subject, *actuals, **contexts]
    end
  end
end
