# frozen_string_literal: true

class Brutal
  class Manifest
    class File
      module Name
        # Suffix for configuration file names.
        SUFFIX = "_brutal.yaml"

        # Suffix pattern for configuration file names.
        SUFFIX_PATTERN = "*#{SUFFIX}"

        # Suffix regex for configuration file names.
        SUFFIX_REGEX = /#{SUFFIX}\z/.freeze
      end
    end
  end
end
