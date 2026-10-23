# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name                   = "brutal"
  spec.version                = File.read(File.join(__dir__, "VERSION.semver")).chomp
  spec.author                 = "Cyril Kato"
  spec.email                  = "contact@cyril.email"
  spec.summary                = "Plain Ruby tests, written from what the code does"
  spec.description            = "Writes framework-free Ruby test files from YAML manifests: runs every combination " \
                                "of contexts in a child process, and checks each observed value with eql?."
  spec.homepage               = "https://fixrb.dev/gems/brutal/"
  spec.license                = "MIT"
  spec.files                  = Dir["LICENSE.md", "README.md", "bin/brutal", "lib/**/*.rb", base: __dir__]
  spec.bindir                 = "bin"
  spec.executables            = ["brutal"]
  spec.required_ruby_version  = ">= 3.3.0"

  spec.add_dependency "aw", "~> 1.0"

  spec.metadata["bug_tracker_uri"]       = "https://github.com/fixrb/brutal/issues"
  spec.metadata["changelog_uri"]         = "https://github.com/fixrb/brutal#changes-in-20"
  spec.metadata["documentation_uri"]     = "https://rubydoc.info/gems/brutal"
  spec.metadata["rubygems_mfa_required"] = "true"
  spec.metadata["source_code_uri"]       = "https://github.com/fixrb/brutal"
end
