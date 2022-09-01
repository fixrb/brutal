# frozen_string_literal: true

require "pathname"

class Brutal
  # Accept an arbitrary number of arguments passed from the command-line.
  class CommandLineArgumentsParser
    DEFAULT_FORMAT = "ruby"
    FILE_SUFFIX = "_brutal.yaml"
    FILE_PATTERN = ::File.join("**", "*#{FILE_SUFFIX}")
    CURRENT_EXECUTION_CONTEXT = "."

    attr_reader :pathnames

    def initialize(*args)
      @any_path = false
      @pathnames = []
      args.each { |arg| parse!(arg) }
      parse!(CURRENT_EXECUTION_CONTEXT) unless any_path?
    end

    def call
      [format, pathnames]
    end

    private

    def any_path?
      @any_path
    end

    def format
      @format || DEFAULT_FORMAT
    end

    def parse!(arg)
      case arg
      when "--format=ruby"
        format!("Ruby")
      when "--help"
        help!
      when "--version"
        version!
      else
        pathname = ::Pathname.new(arg)
        load!(pathname)
      end
    end

    def format!(name)
      raise ::ArgumentError, "Format already filled in." unless format.nil?

      @format = name
    end

    def help!
      puts help_command_output
      exit
    end

    def help_command_output
      <<~TXT
        Usage: #{$PROGRAM_NAME} [options] [files or directories]

            --format=FORMAT Choose "ruby" (default).
            --help          Display this help.
            --version       Display the version.
      TXT
    end

    def load!(pathname)
      @any_path = true

      if pathname.directory?
        pathname.glob(FILE_PATTERN).each { |filename| load!(filename) }
      elsif pathname.file?
        if pathname.to_s.end_with?(FILE_SUFFIX)
          @pathnames << pathname
        else
          warn "Skipping #{pathname} because not suffixed with #{FILE_SUFFIX}."
        end
      else
        raise ::ArgumentError, "#{pathname} is neither a file nor a directory."
      end
    end

    def version!
      abort "Gem not found on the system.  Unknown version." if not_loaded_spec?

      puts loaded_spec.version
      exit
    end

    def loaded_spec
      ::Gem.loaded_specs["brutal"]
    end

    def not_loaded_spec?
      loaded_spec.nil?
    end
  end
end
