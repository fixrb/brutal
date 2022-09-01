# frozen_string_literal: true

%w[
  ruby
].each { |filename| require_relative(File.join("format", filename)) }

class Brutal
  # Brutal::Format
  module Format
    SUPPORT = {
      "ruby" => Ruby
    }.freeze

    DEFAULT = SUPPORT.keys.sort.fetch(-1)
  end
end
