# Brutal 💎🔨

[![Build Status](https://api.travis-ci.org/fixrb/brutal.svg?branch=master)][travis]
[![Gem Version](https://badge.fury.io/rb/brutal.svg)][gem]
[![Inline docs](https://inch-ci.org/github/fixrb/brutal.svg?branch=master)][inchpages]
[![Documentation](http://img.shields.io/:yard-docs-38c800.svg)][rubydoc]

> A _code-first_ approach to automate the writing of unit tests.

## Intro

[![I Hate Tests](https://github.com/fixrb/brutal/raw/master/img/rubyhack-2019-ruby3-what-s-missing-by-yukihiro-matsumoto.png)](https://www.youtube.com/watch?v=cmOt9HhszCI&start=1732&end=1736 "I don't like tests. It's not DRY.")

> I don't like tests. It's not DRY.<br/>
> -- Matz

## Purpose

Take a break and let __Brutal__ shape for you the actual behavior of your code against as many combinations of challenges as needed.

By delegating to it the writing of unit tests, you'll be able to focus on your core business.

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

Brutal's configuration file is `.brutal.yml`.
This file can contains those keys:

* `header` (optional): Some code to execute before the test suite.
* `front_object` (required): The front object of the test suite.
* `subject` (required): The object of each context.
* `variables` (required): A hash to generate the subject of each context.
* `actual_values` (required): A list of tests to challenge the subject.

### Optional parameters

It would also be possible to ask for an RSpec template by passing "`rspec`" argument:

> brutal rspec

## Example

Given this config file:

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

The `brutal` command would generate and write in to a `test.rb` file the following "Plain Old Ruby":

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

And the `brutal rspec` command would generate and write in to a `test_spec.rb` file the following spec:

```ruby
RSpec.describe do
  let(:front_object) { "Hello " }

  context do
    let(:actual) { front_object + 'Alice' }

    it { expect(actual.to_s).to eq("Hello Alice") }
    it { expect(actual.length).to eq(11) }
  end

  context do
    let(:actual) { front_object + 'Bob' }

    it { expect(actual.to_s).to eq("Hello Bob") }
    it { expect(actual.length).to eq(9) }
  end
end
```

More examples are available [here](examples/).

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
