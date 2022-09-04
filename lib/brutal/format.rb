# frozen_string_literal: true

Dir[File.join(File.dirname(__FILE__), "format", "*.rb")].sort.each do |fname|
  require_relative fname
end

class Brutal
  # A collection of formatter classes.
  module Format
  end
end
