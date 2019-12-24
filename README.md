# Brutal 👹

> I don't like testing because it's redundant. If we are smart enough, we can avoid it. <br/>
> -- Matz

[![Build Status](https://api.travis-ci.org/fixrb/brutal.svg?branch=master)][travis]
[![Gem Version](https://badge.fury.io/rb/brutal.svg)][gem]
[![Inline docs](https://inch-ci.org/github/fixrb/brutal.svg?branch=master)][inchpages]
[![Documentation](http://img.shields.io/:yard-docs-38c800.svg)][rubydoc]

__Brutal__ is a _code-first_ approach that automates the writing of unit tests.

By being able to generate test cases from the code itself, developers can focus on their creation, save time and energy, for more happiness.

<p>
  <img
    src="https://github.com/fixrb/brutal/raw/master/img/Ferdinand_Hodler_-_Woodcutter_-_Google_Art_Project.jpg"
    alt="A lumberjack brutally cutting a tree" />
</p>

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
* `front_object` (required): The front object of the test suite.
* `subject` (required): The object of each context.
* `variables` (required): A hash to generate the subject of each context.
* `actual_values` (required): A list of tests to challenge the subject.

## Example

Given this `.brutal.yml` config file:

```yaml
---
front_object: |
  "Hello "

subject: |
  %{front_object} + %{string}

variables:
  string:
    - "'Alice'"
    - "'Bob'"

actual_values:
  - "%{subject}.to_s"
  - "%{subject}.length"
```

The `brutal` command would save this Plain Old Ruby in to a `test.rb` file:

```ruby
front_object = "Hello "

# ------------------------------------------------------------------------------

actual = front_object + 'Alice'
raise unless actual.to_s == "Hello Alice"
raise unless actual.length == 11

# ------------------------------------------------------------------------------

actual = front_object + 'Bob'
raise unless actual.to_s == "Hello Bob"
raise unless actual.length == 9
```

[More examples](examples/) are available.

## Rake integration example

The generated brutal test suite `test.rb` file can be declared as follows:

```ruby
Rake::TestTask.new do |t|
  t.pattern = 'test.rb'
end
```

## Contact

* Home page: https://github.com/fixrb/brutal
* Bugs/issues: https://github.com/fixrb/brutal/issues

## Rubies

* [MRI](https://www.ruby-lang.org/)
* [Rubinius](https://rubinius.com/)
* [JRuby](https://www.jruby.org/)

## Versioning

__Brutal__ follows [Semantic Versioning 2.0](https://semver.org/).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fixrb/brutal. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/fixrb/brutal/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GreatGuardian project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/fixrb/brutal/blob/master/CODE_OF_CONDUCT.md).

[gem]: https://rubygems.org/gems/brutal
[travis]: https://travis-ci.org/fixrb/brutal
[inchpages]: https://inch-ci.org/github/fixrb/brutal
[rubydoc]: https://rubydoc.info/gems/brutal/frames

***

<p>
  This project is sponsored by:<br />
  <a href="https://sashite.com/"><img
    src="https://github.com/fixrb/brutal/raw/master/img/sashite.png"
    alt="Sashite" /></a>
</p>
