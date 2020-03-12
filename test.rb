# frozen_string_literal: true

require 'simplecov'

::SimpleCov.command_name 'Brutal test suite'
::SimpleCov.start

%w[configuration scaffold].each { |file_name| require "./lib/brutal/#{file_name}" }

# ------------------------------------------------------------------------------

settings = YAML.load(<<-SETTINGS, symbolize_names: true)
                     subject: |
                       "Hello " + "%{string}"
                     contexts:
                       string:
                         - Alice
                         - Bob
                     actuals:
                       - "%{subject}.length"
                     SETTINGS

::Brutal::Configuration.module_eval("def self.file!; #{settings}; end")

actual = ::Brutal::Scaffold.new(*::Brutal::Configuration.load!)

raise if actual.blank_line != "\n# ------------------------------------------------------------------------------\n\n"
raise if actual.context_names != [:string]
raise if actual.contexts_values != [["Alice", "Bob"]]
raise if actual.combinations_values != [["Alice"], ["Bob"]]
raise if actual.to_s != "#{::Brutal::Configuration::DEFAULT_HEADER}\n\n# ------------------------------------------------------------------------------\n\nactual = begin\n  \"Hello \" + \"Alice\"\nend\n\nraise if actual.length != 11\n\n# ------------------------------------------------------------------------------\n\nactual = begin\n  \"Hello \" + \"Bob\"\nend\n\nraise if actual.length != 9\n"

# ------------------------------------------------------------------------------

settings = YAML.load(<<-SETTINGS, symbolize_names: true)
                     subject: |
                       "Hello " + "%{string}"
                     contexts:
                       string:
                         - Alice
                         - Bob
                     actuals:
                       - "%{subject}.to_s"
                     SETTINGS

::Brutal::Configuration.module_eval("def self.file!; #{settings}; end")

actual = ::Brutal::Scaffold.new(*::Brutal::Configuration.load!)

raise if actual.blank_line != "\n# ------------------------------------------------------------------------------\n\n"
raise if actual.context_names != [:string]
raise if actual.contexts_values != [["Alice", "Bob"]]
raise if actual.combinations_values != [["Alice"], ["Bob"]]
raise if actual.to_s != "#{::Brutal::Configuration::DEFAULT_HEADER}\n\n# ------------------------------------------------------------------------------\n\nactual = begin\n  \"Hello \" + \"Alice\"\nend\n\nraise if actual.to_s != \"Hello Alice\"\n\n# ------------------------------------------------------------------------------\n\nactual = begin\n  \"Hello \" + \"Bob\"\nend\n\nraise if actual.to_s != \"Hello Bob\"\n"
