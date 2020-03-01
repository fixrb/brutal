# frozen_string_literal: true

require 'simplecov'

::SimpleCov.command_name 'Brutal test suite'
::SimpleCov.start

require './lib/brutal'

# ------------------------------------------------------------------------------

actual = begin
  Brutal::Scaffold.new("require './lib/brutal/scaffold'", '"Hello %{context_string}"', *"%{subject}.to_s", context_string: ["Alice", "Bob"])
end

raise if actual.to_s != "require './lib/brutal/scaffold'\n\n# ------------------------------------------------------------------------------\n\nactual = begin\n  \"Hello Alice\"\nend\n\nraise if actual.to_s != \"Hello Alice\"\n\n# ------------------------------------------------------------------------------\n\nactual = begin\n  \"Hello Bob\"\nend\n\nraise if actual.to_s != \"Hello Bob\"\n"
