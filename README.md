# Brutal 💎🔨

[![RuboCop Status](https://github.com/fixrb/brutal/workflows/RuboCop/badge.svg)][workflow_rubocop]
[![Build Status](https://api.travis-ci.org/fixrb/brutal.svg?branch=master)][travis]
[![Gem Version](https://badge.fury.io/rb/brutal.svg)][gem]
[![Inline docs](https://inch-ci.org/github/fixrb/brutal.svg?branch=master)][inchpages]
[![Documentation](http://img.shields.io/:yard-docs-38c800.svg)][rubydoc]

> A _code-first_ approach to automate the writing of unit tests.

# Intro

[![I Hate Tests](https://github.com/fixrb/brutal/raw/master/img/rubyhack-2019-ruby3-what-s-missing-by-yukihiro-matsumoto.jpg)](https://www.youtube.com/embed/cmOt9HhszCI?start=1732&end=1736 "I don't like tests. It's not DRY.")

> I don't like tests. It's not DRY.<br/>
> -- [Matz](https://github.com/matz)

## Overview

Let __Brutal__ shape for you in no time the actual behavior of your code through as many combinations of contexts as needed.

By delegating to __Brutal__ the repetitive (and redundant) task of writing tests, you'll be able to focus on your core business: the code itself.

## Warning

__Brutal__ development process does not prevent from bugs.

As a _picture of the behavior of the code_,
a generated test suite is wrong as long as the code is wrong,
regardless of whether all true expectations.

However, this document becomes relevant when it shows that the code behaves as it is supposed to.
It is therefore important to read it well.
This is the price for _Brutal-Driven Development_.

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

The `brutal.yml` file is a manifest you can use to define your __Brutal__ meta-spec.
It has 4 top-level sections:

* `header` - Specifies the code to execute before generating the test suite.
* `subject` - Specifies the template of the code to be declined across contexts.
* `contexts` - Specifies a list of variables to populate the subject's template.
* `actuals` - Specifies templates to challenge evaluated subjects & get results.

### Getting started

1. Create a `brutal.yml` file in your application's root directory.
The following example `brutal.yml` defines the shape of a Hello test suite:

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

2. Run the `brutal` command from the same directory.

3. Read the generated `test.rb` file in the same directory:

```ruby
# Brutal test suite

# ------------------------------------------------------------------------------

actual = begin
  "Hello " + "Alice"
end

raise if actual.to_s != "Hello Alice"
raise if actual.length != 11

# ------------------------------------------------------------------------------

actual = begin
  "Hello " + "Bob"
end

raise if actual.to_s != "Hello Bob"
raise if actual.length != 9
```

### More examples

https://github.com/fixrb/brutal/raw/master/examples/

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
