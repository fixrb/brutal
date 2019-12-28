# frozen_string_literal: true

require 'simplecov'

SimpleCov.command_name 'Brutal test suite'
SimpleCov.start

require './lib/brutal'

# ------------------------------------------------------------------------------

front_object = Brutal::ScaffoldGenerator::Por

# ------------------------------------------------------------------------------

actual = front_object.new(42, "%{front_object}.%{challenge}", *"%{subject}.to_s", challenge: ["abs", "-(2)"])

raise unless actual.to_s == %q(# ------------------------------------------------------------------------------

front_object = 42

# ------------------------------------------------------------------------------

actual = front_object.abs

raise unless actual.to_s == "42"

# ------------------------------------------------------------------------------

actual = front_object.-(2)

raise unless actual.to_s == "40"
)
