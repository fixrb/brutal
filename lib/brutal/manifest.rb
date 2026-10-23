# frozen_string_literal: true

require "psych"

module Brutal
  # The sections of a `NAME_brutal.yaml` file, as the text written in it.
  #
  # The YAML file is read as a tree of nodes and never loaded into Ruby
  # objects: `1,2`, `yes` and `~` stay the text `1,2`, `yes` and `~`. Only
  # the line breaks that end a value are dropped. A value of several lines
  # must be a literal block (`|`), which YAML does not fold. Anchors, aliases
  # and tags are refused, as are unknown, duplicate, missing or empty
  # sections.
  #
  # @!attribute [r] path
  #   @return [String] the path of the manifest
  # @!attribute [r] header
  #   @return [String, nil] code run once, before the first example
  # @!attribute [r] before
  #   @return [String, nil] code run before each example
  # @!attribute [r] subject
  #   @return [String] the code of each example, with a `%{name}` for each context
  # @!attribute [r] contexts
  #   @return [Hash{String => Array<String>}] the code fragments of each context, in the order of the file
  # @!attribute [r] actuals
  #   @return [Array<String>] the expressions observed on the subject, with `%{subject}` for its value
  # @!attribute [r] after
  #   @return [String, nil] code run after each example
  # @!attribute [r] footer
  #   @return [String, nil] code run once, after the last example
  Manifest = ::Data.define(:path, :header, :before, :subject, :contexts, :actuals, :after, :footer)

  # Reading a manifest.
  class Manifest
    # The end of a manifest's file name.
    SUFFIX = "_brutal.yaml"

    NAME = /\A[A-Za-z0-9_][A-Za-z0-9_.-]*_brutal\.yaml\z/
    BOM = "\xEF\xBB\xBF".b
    CONTEXT = /\A[A-Za-z_][A-Za-z0-9_]*\z/
    SECTIONS = %w[header before subject contexts actuals after footer].freeze
    REQUIRED = %w[subject contexts actuals].freeze

    private_constant :NAME, :BOM, :CONTEXT, :SECTIONS, :REQUIRED

    # Reads the manifest at `path`.
    #
    # @param path [String]
    # @return [Brutal::Manifest]
    # @raise [Brutal::Error] when the manifest is not valid
    # @raise [SystemCallError] when the file cannot be read
    def self.read(path)
      unless NAME.match?(::File.basename(path).b)
        raise Error, "the file name must be NAME#{SUFFIX}, NAME made of ASCII letters, digits, " \
                     "\".\", \"_\" and \"-\", not starting with \".\" or \"-\""
      end

      sections = mapping(root(path), "the manifest")
      check(sections)
      new(path:, contexts: contexts(sections.fetch("contexts")),
          actuals: sequence(sections.fetch("actuals"), "actuals"),
          **(SECTIONS - %w[contexts actuals]).to_h { |name| [name.to_sym, optional(sections, name)] })
    end

    # The root node of the only document of the file.
    def self.root(path)
      text = ::File.binread(path).delete_prefix(BOM).force_encoding(::Encoding::UTF_8)
      raise Error, "the file is not valid UTF-8" unless text.valid_encoding?

      documents = ::Psych.parse_stream(text, filename: path).children
      raise Error, "the file must hold one YAML document" unless documents.size == 1

      documents.first.root
    rescue ::Psych::SyntaxError => e
      raise Error, "invalid YAML at line #{e.line}, column #{e.column}: #{e.problem}"
    end

    # Refuses unknown and missing sections.
    def self.check(sections)
      unknown = sections.keys - SECTIONS
      raise Error, "unknown section #{unknown.first.dump}" unless unknown.empty?

      missing = REQUIRED - sections.keys
      raise Error, "the section #{missing.first} is missing" unless missing.empty?
    end

    # The fragments of each context, by name.
    def self.contexts(node)
      contexts = mapping(node, "contexts").to_h do |name, list|
        unless CONTEXT.match?(name)
          raise Error, "the context #{name.dump} must be named with letters, digits and _, not starting with a digit"
        end

        [name, sequence(list, "contexts.#{name}")]
      end
      raise Error, "contexts must not be empty" if contexts.empty?

      contexts.freeze
    end

    # The text of an optional section, or nil.
    def self.optional(sections, name)
      scalar(sections[name], name) if sections.key?(name)
    end

    # A mapping, as a hash of its keys' text to its value nodes.
    def self.mapping(node, where)
      plain(node, ::Psych::Nodes::Mapping, where, "a mapping")
      node.children.each_slice(2).with_object({}) do |(key, value), hash|
        name = scalar(key, "a key of #{where}")
        raise Error, "#{where} has the key #{name.dump} twice" if hash.key?(name)

        hash[name] = value
      end
    end

    # A non-empty sequence, as the text of its items.
    def self.sequence(node, where)
      plain(node, ::Psych::Nodes::Sequence, where, "a list")
      raise Error, "#{where} must not be empty" if node.children.empty?

      node.children.each_with_index.map { |item, index| scalar(item, "#{where}[#{index}]") }.freeze
    end

    # The text of a scalar, without the line breaks that end it. Only a
    # literal block may span several lines: YAML folds the others.
    def self.scalar(node, where)
      plain(node, ::Psych::Nodes::Scalar, where, "text")
      if node.style != ::Psych::Nodes::Scalar::LITERAL && node.end_line > node.start_line
        raise Error, "#{where} spans several lines: write it as a literal block (|)"
      end

      text = node.value.sub(/\n+\z/, "")
      raise Error, "#{where} must not be empty" if text.strip.empty?

      text.freeze
    end

    # Checks the type of a node, and that it has no alias, anchor or tag.
    def self.plain(node, type, where, what)
      raise Error, "#{where} must not be an alias" if node.instance_of?(::Psych::Nodes::Alias)
      raise Error, "#{where} must be #{what}" unless node.instance_of?(type)
      raise Error, "#{where} must not have an anchor or a tag" if node.anchor || node.tag
    end

    private_class_method :root, :check, :contexts, :optional, :mapping, :sequence, :scalar, :plain
  end
end
