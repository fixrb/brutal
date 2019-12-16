# Brutal

> Brutal test suite scaffold generator

![A lumberjack brutally cutting a tree.](https://raw.githubusercontent.com/cyril/brutal.rb/master/img/Ferdinand_Hodler_-_Woodcutter_-_Google_Art_Project.jpg)

[![Build Status](https://api.travis-ci.org/cyril/brutal.rb.svg?branch=master)][travis]
[![Gem Version](https://badge.fury.io/rb/brutal.svg)][gem]
[![Inline docs](https://inch-ci.org/github/cyril/brutal.rb.svg?branch=master)][inchpages]
[![Documentation](http://img.shields.io/:yard-docs-38c800.svg)][rubydoc]

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'brutal'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install brutal

## Quick Start

Just type `brutal` in a Ruby project's folder and watch the magic happen.

## Usage

The Brutal YAML file handles 4 keys:

* `header` (optional): Some code to execute before the test suite.
* `subject` (required): The front object of the test suite.
* `variables` (required): A hash to decline the subject in to various contexts.
* `challenges` (required): An array of methods to apply to each result.

## Example

Given this `.brutal.yml` config file:

```yaml
---
header: |
  # Some string concatenation unit tests

subject: |
  "Hello" + "%{hello_target}%{punctuation_mark}"

variables:
  :hello_target:
    -
    - ", Bob"

  :punctuation_mark:
    - "!"
    - ...

challenges:
  - "%{actual}.to_s"
  - "%{actual}.length"
```

The `brutal` command would generate the following file:

```ruby
# Some string concatenation unit tests

# ------------------------------------------------------------------------------

actual = "Hello" + "!"

raise unless actual.to_s == "Hello!"
raise unless actual.length == 6

# ------------------------------------------------------------------------------

actual = "Hello" + "..."

raise unless actual.to_s == "Hello..."
raise unless actual.length == 8

# ------------------------------------------------------------------------------

actual = "Hello" + ", Bob!"

raise unless actual.to_s == "Hello, Bob!"
raise unless actual.length == 11

# ------------------------------------------------------------------------------

actual = "Hello" + ", Bob..."

raise unless actual.to_s == "Hello, Bob..."
raise unless actual.length == 13
```

## Integration with Rake

The generated brutal test suite `test.rb` file can be declared as follows:

```ruby
Rake::TestTask.new do |t|
  t.pattern = 'test.rb'
end
```

## Contact

* Home page: https://github.com/cyril/brutal.rb
* Bugs/issues: https://github.com/cyril/brutal.rb/issues

## Rubies

* [MRI](https://www.ruby-lang.org/)
* [Rubinius](https://rubinius.com/)
* [JRuby](https://www.jruby.org/)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cyril/brutal.rb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/cyril/brutal.rb/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GreatGuardian project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/cyril/brutal.rb/blob/master/CODE_OF_CONDUCT.md).

[gem]: https://rubygems.org/gems/brutal
[travis]: https://travis-ci.org/cyril/brutal.rb
[inchpages]: https://inch-ci.org/github/cyril/brutal.rb
[rubydoc]: https://rubydoc.info/gems/brutal/frames
