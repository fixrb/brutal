# frozen_string_literal: true

%w[
  read
  write
].each { |filename| require_relative(File.join("file", filename)) }

class Brutal
  # Brutal::File
  module File
    RUBY_EXTENSION = ".rb"

    def self.generated_pathname(pathname)
      pathname.sub_ext(RUBY_EXTENSION)
    end
  end
end
