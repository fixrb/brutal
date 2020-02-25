# frozen_string_literal: true

%w[
  configuration
  scaffold
].each { |file_name| require_relative File.join('brutal', file_name) }

# The Brutal namespace
module Brutal
  def self.configuration
    Configuration.load!
  end

  def self.generate
    Scaffold.new(*configuration)
  end

  def self.generate!
    file = ::File.open('test.rb', 'w')
    file.write(generate)

    true
  ensure
    file.close
  end
end
