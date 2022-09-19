#!/usr/bin/env ruby
# frozen_string_literal: true

# This static test file was generated by `brutal` using Brutal version 1.6.0.beta4.

begin
  require_relative "../../../lib/brutal/format"
rescue ::LoadError
  require "../../../lib/brutal/format"
end

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  ::Brutal::Format::Ruby.new("# frozen_string_literal: true", "# Before example", "'Hello ' + '%{string}'", "# After example", "# End of test", *"%{subject}.length", **{"string"=>["Alice", "Bob"]})
end

raise if actual.context_names != ["string"]
raise if actual.contexts_values != [["Alice", "Bob"]]
raise if actual.combinations_values != [["Alice"], ["Bob"]]
raise if actual.thematic_break_code != "# ------------------------------------------------------------------------------\n"
raise if actual.to_s != "# frozen_string_literal: true\n\n# ------------------------------------------------------------------------------\n\n# Before example\n\nactual = begin\n  'Hello ' + 'Alice'\nend\n\nraise if actual.length != 11\n\n# After example\n\n# ------------------------------------------------------------------------------\n\n# Before example\n\nactual = begin\n  'Hello ' + 'Bob'\nend\n\nraise if actual.length != 9\n\n# After example\n\n# ------------------------------------------------------------------------------\n\n# End of test\n"

# Finishing a test

# ------------------------------------------------------------------------------

# Starting a test

actual = begin
  ::Brutal::Format::Ruby.new("# frozen_string_literal: true", "# Before example", "'Hello ' + '%{string}'", "# After example", "# End of test", *"%{subject}.to_s", **{"string"=>["Alice", "Bob"]})
end

raise if actual.context_names != ["string"]
raise if actual.contexts_values != [["Alice", "Bob"]]
raise if actual.combinations_values != [["Alice"], ["Bob"]]
raise if actual.thematic_break_code != "# ------------------------------------------------------------------------------\n"
raise if actual.to_s != "# frozen_string_literal: true\n\n# ------------------------------------------------------------------------------\n\n# Before example\n\nactual = begin\n  'Hello ' + 'Alice'\nend\n\nraise if actual.to_s != \"Hello Alice\"\n\n# After example\n\n# ------------------------------------------------------------------------------\n\n# Before example\n\nactual = begin\n  'Hello ' + 'Bob'\nend\n\nraise if actual.to_s != \"Hello Bob\"\n\n# After example\n\n# ------------------------------------------------------------------------------\n\n# End of test\n"

# Finishing a test

# ------------------------------------------------------------------------------

# End of the brutal test
