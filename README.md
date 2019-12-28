# Brutal 💎🔨

[![Build Status](https://api.travis-ci.org/fixrb/brutal.svg?branch=master)][travis]
[![Gem Version](https://badge.fury.io/rb/brutal.svg)][gem]
[![Inline docs](https://inch-ci.org/github/fixrb/brutal.svg?branch=master)][inchpages]
[![Documentation](http://img.shields.io/:yard-docs-38c800.svg)][rubydoc]

> A _code-first_ approach to automate the writing of unit tests.

## Intro

[![I Hate Tests](https://github.com/fixrb/brutal/raw/master/img/rubyhack-2019-ruby3-what-s-missing-by-yukihiro-matsumoto.svg)](https://www.youtube.com/embed/cmOt9HhszCI?start=1732&end=1736 "I don't like tests. It's not DRY.")

> I don't like tests. It's not DRY.<br/>
> -- [Matz](https://github.com/matz)

## Purpose

Take a break and let __Brutal__ shape for you the actual behavior of your code against as many combinations of challenges as needed.

Without giving the power to test everything, it makes it easy to generate in no time a set of tests for all relevant contexts.

By delegating to __Brutal__ the repetitive and redundant task of writing tests, you'll be able to focus on your core business: writing code.

## Warning

__Brutal__ does not prevent from bugs.
As a picture of the behavior of the code, its generated tests would be wrong if the code is wrong.

This is why it is important to carefully read the generated test suite, to ensure that it describes the behavior of the code as it is supposed to behave.

However, when the `brutal` command is executed successfully,
we can consider that both __Brutal__'s configuration file (`.brutal.yml`) and evaluated code as syntactically correct.

In the context of a versioned project, to avoid regressions,
the integrity of the behavior of the code can easily be checked by re-generating a picture to be compared with the previous one.
Here is an example with [The Greeter class](https://github.com/fixrb/brutal/raw/master/examples/the_greeter_class/) code:

```sh
git diff
```

```diff
  # The Greeter class
  class Greeter
    def initialize(name)
-     @name = name
+     @name = name.capitalize
    end

    def salute
      "Hello #{@name}!"
    end
  end
```

```diff
  require './greeter'

  # ------------------------------------------------------------------------------

  front_object = Greeter

  # ------------------------------------------------------------------------------

  actual = front_object.new('world')

- raise unless actual.salute == "Hello world!"
+ raise unless actual.salute == "Hello World!"
```

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

__Brutal__'s configuration file is `.brutal.yml`, which acts like a meta-spec.
This YAML file can contains the following keys:

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

More examples are available [here](https://github.com/fixrb/brutal/raw/master/examples/).

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

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

***

<p>
  This project is sponsored by:<br />
  <a href="https://sashite.com/"><img
    src="https://github.com/fixrb/brutal/raw/master/img/sashite.png"
    alt="Sashite" /></a>
</p>

[gem]: https://rubygems.org/gems/brutal
[travis]: https://travis-ci.org/fixrb/brutal
[inchpages]: https://inch-ci.org/github/fixrb/brutal
[rubydoc]: https://rubydoc.info/gems/brutal/frames
