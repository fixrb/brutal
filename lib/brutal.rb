# frozen_string_literal: true

%w[
  configuration
  scaffold
].each { |file_name| require_relative(File.join('brutal', file_name)) }

# The Brutal namespace
module Brutal
  def self.settings
    Configuration.load!
  end

  def self.generate
    Scaffold.new(*settings)
  end

  def self.generate!
    file = ::File.open('test.rb', 'w')
    file.write(generate)

    true
  ensure
    file.close
  end
end
