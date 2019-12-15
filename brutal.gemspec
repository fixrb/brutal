# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name         = 'brutal'
  spec.version      = File.read('VERSION.semver').chomp
  spec.author       = 'Cyril Kato'
  spec.email        = 'contact@cyril.email'
  spec.summary      = 'Brutal test suite scaffold generator'
  spec.description  = spec.summary
  spec.homepage     = 'https://github.com/cyril/brutal.rb'
  spec.license      = 'MIT'
  spec.files        = Dir['LICENSE.md', 'README.md', 'bin/*', 'lib/**/*']
  spec.executables  = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }

  spec.add_development_dependency 'bundler',    '~> 2.0'
  spec.add_development_dependency 'rake',       '~> 13.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'simplecov',  '~> 0.17'
  spec.add_development_dependency 'yard',       '~> 0.9'
end
