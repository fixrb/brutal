# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name         = "brutal"
  spec.version      = ::File.read("VERSION.semver").chomp
  spec.author       = "Cyril Kato"
  spec.email        = "contact@cyril.email"
  spec.summary      = "A code-first approach " \
                      "to automate the writing of unit tests."
  spec.description  = spec.summary
  spec.homepage     = "https://github.com/fixrb/brutal"
  spec.license      = "MIT"
  spec.files        = ::Dir["LICENSE.md", "README.md", "bin/brutal", "lib/**/*"]
  spec.executables  = spec.files.grep(%r{^bin/}) { |f| ::File.basename(f) }

  spec.required_ruby_version = ">= 2.7.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rubocop-gitlab-security"
  spec.add_development_dependency "rubocop-md"
  spec.add_development_dependency "rubocop-performance"
  spec.add_development_dependency "rubocop-rake"
  spec.add_development_dependency "rubocop-thread_safety"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "yard"

  spec.metadata["rubygems_mfa_required"] = "true"
end
