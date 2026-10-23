# frozen_string_literal: true

module Brutal
  # Where a test file goes, and how it is written: next to its manifest,
  # whole or not at all, and only over a file that brutal wrote.
  module Output
    CREATE = ::File::WRONLY | ::File::CREAT | ::File::EXCL
    private_constant :CREATE

    # @param manifest_path [String] the path of a `NAME_brutal.yaml` file
    # @return [String] the path of `test_NAME.rb`, in the same directory, spelled like the manifest's path
    def self.target(manifest_path)
      name = ::File.basename(manifest_path)
      "#{manifest_path.delete_suffix(name)}test_#{name.delete_suffix(Manifest::SUFFIX)}.rb"
    end

    # @param path [String]
    # @param source [String]
    # @return [Boolean] whether the file at `path` is a regular file holding exactly `source`
    def self.current?(path, source)
      ::File.file?(path) && !::File.symlink?(path) && ::File.binread(path) == source.b
    end

    # Refuses to replace anything but a file that brutal wrote.
    #
    # @param path [String]
    # @return [void]
    # @raise [Brutal::Error] when `path` is a symbolic link, is not a regular file, or was not written by brutal
    def self.check(path)
      raise Error, "#{path} is a symbolic link" if ::File.symlink?(path)
      return unless ::File.exist?(path)
      raise Error, "#{path} is not a regular file" unless ::File.file?(path)

      first = ::File.open(path, "rb") { |file| file.read(Program::MARK.bytesize) }
      return if first == Program::MARK.b

      raise Error, "#{path} was not written by brutal 2 (delete it once if brutal 1 wrote it)"
    end

    # Writes the source to a temporary file in the same directory, with the
    # permissions of the file it replaces (never its setuid, setgid or sticky
    # bits), hands it to the block, then renames it
    # over `path`: a reader sees the old file or the new one, never a part of
    # either. An unchanged file is left untouched, and handed to the block.
    #
    # @param path [String]
    # @param source [String]
    # @yieldparam file [String] the path of the temporary file, or of the
    #   unchanged file; the block refuses it by raising
    # @return [void]
    # @raise [Brutal::Error] when `path` cannot be replaced (see {check})
    # @raise [SystemCallError] when the file cannot be written
    def self.write(path, source, &)
      check(path)
      if current?(path, source)
        yield path if block_given?
      else
        replace(path, source, &)
      end
    end

    # Writes the source to a temporary file, then installs it.
    def self.replace(path, source, &)
      temporary = ::File.join(::File.dirname(path), ".#{::File.basename(path)}.#{::Process.pid}.tmp")
      create(temporary, source, (::File.stat(path).mode & 0o777 if ::File.exist?(path)))
      install(temporary, path, &)
    end

    # Creates the temporary file, which must not exist yet: a file left by
    # another process is an error, and is not removed.
    def self.create(temporary, source, mode)
      ::File.open(temporary, CREATE, 0o666, binmode: true) do |file|
        file.chmod(mode) if mode
        file.write(source)
        file.fsync
      rescue ::Exception # rubocop:disable Lint/RescueException
        ::File.unlink(temporary)
        raise
      end
    end

    # Hands the temporary file to the block, then renames it over the path;
    # removes it if either fails.
    def self.install(temporary, path)
      yield temporary if block_given?
      ::File.rename(temporary, path)
    rescue ::Exception # rubocop:disable Lint/RescueException
      ::File.unlink(temporary)
      raise
    end

    private_class_method :replace, :create, :install
  end
end
