# frozen_string_literal: true

module Brutal
end

Dir[File.join File.dirname(__FILE__), 'brutal', 'framework', '*.rb'].each do |fname|
  require_relative fname
end
