# frozen_string_literal: true

# Main namespace
#
# @api public
module Brutal
end

Dir[File.join File.dirname(__FILE__), 'brutal', 'scaffold_generator', '*.rb'].each do |fname|
  require_relative fname
end
