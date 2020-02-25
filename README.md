# Brutal 💎🔨

[![RuboCop Status](https://github.com/fixrb/brutal/workflows/RuboCop/badge.svg)][workflow_rubocop]
[![Build Status](https://api.travis-ci.org/fixrb/brutal.svg?branch=master)][travis]
[![Gem Version](https://badge.fury.io/rb/brutal.svg)][gem]
[![Inline docs](https://inch-ci.org/github/fixrb/brutal.svg?branch=master)][inchpages]
[![Documentation](http://img.shields.io/:yard-docs-38c800.svg)][rubydoc]

> A _code-first_ approach to automate the writing of unit tests.

## Why

[![I Hate Tests](https://github.com/fixrb/brutal/raw/master/img/rubyhack-2019-ruby3-what-s-missing-by-yukihiro-matsumoto.jpg)](https://www.youtube.com/embed/cmOt9HhszCI?start=1732&end=1736 "I don't like tests. It's not DRY.")

> I don't like tests. It's not DRY.<br/>
> -- [Matz](https://github.com/matz)

## Purpose

Let __Brutal__ shape for you the actual behavior of your code against as many combinations of challenges as needed.

Without giving the power to test everything, it makes it easy to generate in no time a set of tests for all relevant contexts.

By delegating to __Brutal__ this repetitive (and redundant) job of writing tests, you'll be able to focus on your core business: the code.

## Warning

__Brutal__ does not prevent from bugs.
As a picture of the behavior of the code, generated tests would be wrong if the code is wrong.

This is why it is important to carefully read a generated test suite, to ensure that it describes the behavior of the code as it is expected to behave.

This is the cost to enter the _Brutal-Driven Development_ with confidence.

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

## Settings

__Brutal__'s configuration file is `.brutal.yml`.

A `.brutal.yml` manifest has 4 top-level sections:

* `header` - Specifies the code to execute before generating the test suite.
* `subject` - Specifies the template of the code to be declined across contexts.
* `contexts` - Specifies a list of variables to populate the subject's template.
* `actuals` - Specifies templates to challenge evaluated subjects & get results.

### Example

Given the following configuration:

```yaml
---
subject: |
  "Hello " + "%{string}"

contexts:
  string:
    - Alice
    - Bob

actuals:
  - "%{subject}.to_s"
  - "%{subject}.length"
```

After running the `brutal` command in the same directory,
a `test.rb` file should be generated:

```ruby
# Brutal test suite

# ------------------------------------------------------------------------------

actual = begin
  "Hello " + "Alice"
end

raise unless actual.to_s == "Hello Alice"
raise unless actual.length == 11

# ------------------------------------------------------------------------------

actual = begin
  "Hello " + "Bob"
end

raise unless actual.to_s == "Hello Bob"
raise unless actual.length == 9
```

And when executed as is, no exceptions should be thrown as long as the behavior of the code does not change.

> ruby test.rb

For more examples: https://github.com/fixrb/brutal/raw/master/examples/

### Behavioral integrity

In versioned projects,
the integrity of the behavior of the code could easily be compared by executing `brutal` after changes.

Assuming a project is versioned with `git`, if something goes wrong,
the `git diff test.rb` command would instantly show changes between the behavior of the previous code and the behavior of the new one.

Example of regression from [The Greeter class](https://github.com/fixrb/brutal/raw/master/examples/the_greeter_class/):

```diff
  require './greeter'

  # ------------------------------------------------------------------------------

  actual = Greeter.new('world')

- raise unless actual.salute == "Hello World!"
+ raise unless actual.salute == "Hello !"
```

## Rake integration example

A generated `test.rb` file could be matched as follows:

```ruby
Rake::TestTask.new do |t|
  t.pattern = 'test.rb'
end
```

## Contact

* Source code: https://github.com/fixrb/brutal

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

[workflow_rubocop]: https://github.com/fixrb/brutal/actions?query=workflow%3ARuboCop
[gem]: https://rubygems.org/gems/brutal
[travis]: https://travis-ci.org/fixrb/brutal
[inchpages]: https://inch-ci.org/github/fixrb/brutal
[rubydoc]: https://rubydoc.info/gems/brutal/frames
