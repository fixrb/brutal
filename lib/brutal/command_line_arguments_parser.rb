# frozen_string_literal: true

require_relative File.join("manifest", "file", "name")

require "pathname"

class Brutal
  # Accept an arbitrary number of arguments passed from the command-line.
  class CommandLineArgumentsParser
    MANIFEST_FILENAME_PATTERN = ::File.join("**", Manifest::File::Name::SUFFIX_PATTERN)
    CURRENT_DIRECTORY_CONTEXT = "."
    GEM_NAME                  = "brutal"
    HELP_OPTION               = "--help"
    VERSION_OPTION            = "--version"
    RUBY_FORMAT_OPTION        = "--format=ruby"
    DEFAULT_FORMAT_OPTION     = RUBY_FORMAT_OPTION

    FORMAT_OPTIONS = {
      RUBY_FORMAT_OPTION => :Ruby
    }.freeze

    DEFAULT_FORMAT  = FORMAT_OPTIONS.fetch(DEFAULT_FORMAT_OPTION)
    DEFAULT_FORMATS = [DEFAULT_FORMAT].freeze

    attr_reader :pathnames

    def initialize(*args)
      args.each do |arg|
        help!     if arg == HELP_OPTION
        version!  if arg == VERSION_OPTION
      end

      @formats   = []
      @pathnames = []

      args << CURRENT_DIRECTORY_CONTEXT unless any_path_given?(*args)
      args.each { |arg| parse!(arg) }
    end

    def call
      [formats, pathnames]
    end

    private

    def formats
      @formats.empty? ? DEFAULT_FORMATS : @formats
    end

    def parse!(arg)
      case arg
      when RUBY_FORMAT_OPTION
        @formats << FORMAT_OPTIONS.fetch(RUBY_FORMAT_OPTION)
      else
        load!(::Pathname.new(arg))
      end
    end

    def help!
      puts help_message
      exit
    end

    def help_message
      <<~TXT
        Usage: #{$PROGRAM_NAME} [options] [files or directories]

            --format=FORMAT Choose "ruby" (default).
            --help          Display this help.
            --version       Display the version.
      TXT
    end

    def load!(pathname)
      if pathname.directory?
        pathname.glob(MANIFEST_FILENAME_PATTERN).each { |filename| load!(filename) }
      elsif pathname.file?
        load_file!(pathname)
      else
        raise ::ArgumentError, "#{pathname} is neither a file nor a directory."
      end
    end

    def load_file!(pathname)
      if pathname.fnmatch?(MANIFEST_FILENAME_PATTERN, ::File::FNM_PATHNAME | ::File::FNM_DOTMATCH)
        @pathnames << pathname
      else
        warn "Skipping #{pathname} because not matched against #{MANIFEST_FILENAME_PATTERN}."
      end
    end

    def any_path_given?(*args)
      path_args(*args).any?
    end

    def path_args(*args)
      args - FORMAT_OPTIONS.keys
    end

    def version!
      abort "Gem not found on the system.  Unknown version." if not_loaded_spec?

      puts loaded_spec.version
      exit
    end

    def loaded_spec
      ::Gem.loaded_specs[GEM_NAME]
    end

    def not_loaded_spec?
      loaded_spec.nil?
    end
  end
end
