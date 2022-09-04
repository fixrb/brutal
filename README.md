# Brutal 💎🔨

[![Version](https://img.shields.io/github/v/tag/fixrb/brutal?label=Version&logo=github)](https://github.com/fixrb/brutal/tags)
[![Yard documentation](https://img.shields.io/badge/Yard-documentation-blue.svg?logo=github)](https://rubydoc.info/github/fixrb/brutal/main)
[![Ruby](https://github.com/fixrb/brutal/workflows/Ruby/badge.svg?branch=main)](https://github.com/fixrb/brutal/actions?query=workflow%3Aruby+branch%3Amain)
[![RuboCop](https://github.com/fixrb/brutal/workflows/RuboCop/badge.svg?branch=main)](https://github.com/fixrb/brutal/actions?query=workflow%3Arubocop+branch%3Amain)
[![License](https://img.shields.io/github/license/fixrb/brutal?label=License&logo=github)](https://github.com/fixrb/brutal/raw/main/LICENSE.md)

> A _code-first_ approach to automate the writing of unit tests.

## Intro

[![I Hate Tests](https://github.com/fixrb/brutal/raw/main/img/rubyhack-2019-ruby3-what-s-missing-by-yukihiro-matsumoto.jpg)](https://www.youtube.com/embed/cmOt9HhszCI?start=1732&end=1736 "I don't like tests. It's not DRY.")

> I don't like tests. It's not DRY.
> -- [Matz](https://github.com/matz)

## Overview

Let __Brutal__ craft for you in no time a (potentially huge) framework-less vanilla Ruby file describing the actual behavior of your code across as many context combinations as necessary.

By delegating to __Brutal__ the repetitive (and redundant) task of writing tests, you will be able to focus on your core business: the code itself.

![Brutal-Driven Development](https://github.com/fixrb/brutal/raw/main/img/brutal-driven-development.jpg)

## Warning

The _Brutal-Driven Development_ process does not prevent bugs from appearing in the code.

A generated test suite acts as a _picture of the code's behavior_. Therefore, if the code is wrong, the picture of the code's behavior will also be wrong.

The mere fact that all expectations are true does not mean that the code behaves as it should.

It is therefore the responsibility of the developer to analyze the generated behavioral pictures to ensure that the code reacts as it is supposed to according to the contexts in which it is evaluated.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "brutal", ">= 1.6.0.beta1", require: false
```

And then execute:

```sh
bundle install
```

Or install it yourself as:

```sh
gem install brutal --pre
```

## Usage

### YAML manifest

__Brutal__ needs configuration files in YAML format to know how to write tests.
Configuration file names are suffixed by `_brutal.yaml` and composed of 4 top-level sections:

* `header` - Specifies the code to execute before generating the test suite.
* `subject` - Specifies the template of the code to be declined across contexts.
* `contexts` - Specifies a list of variables to populate the subject's template.
* `actuals` - Specifies templates to challenge evaluated subjects & get results.

### Command line

The `brutal` command comes with several options you can use to customize Brutal's behavior.

For a full list of options, run the `brutal` command with the `--help` flag:

```sh
brutal --help
```

```txt
Usage: brutal [options] [files or directories]

    --format=FORMAT Choose "ruby" (default).
    --help          Display this help.
    --version       Display the version.
```

Assuming that in the workspace there is a configuration file named `user_brutal.yaml`, the test suite can be generated via one of these commands:

```sh
brutal user_brutal.yaml
```

or:

```sh
brutal .
```

or even:

```sh
brutal
```

This would create a `test_user.rb` file containing the test suite.

Assuming now that in the workspace there are a large number of configuration files named in the `spec/` folder, the complete test suite could be generated recursively via this command:

```sh
brutal spec/
```

This would create one test file per configuration file matching `./spec/**/*_brutal.yaml` in to `./spec/**/test_*.rb`.

### Some examples

<https://github.com/fixrb/brutal/tree/main/examples/>

## Rake integration example

Generated test suite files could be matched as follows:

```ruby
Rake::TestTask.new do |t|
  t.pattern = "**/test_*.rb"
end
```

## Contact

* Source code: https://github.com/fixrb/brutal

## Versioning

__Brutal__ follows [Semantic Versioning 2.0](https://semver.org/).

## License

The [gem](https://rubygems.org/gems/brutal) is available as open source under the terms of the [MIT License](https://github.com/fixrb/brutal/raw/main/LICENSE.md).

***

This project is sponsored by [Sashité](https://github.com/sashite/):

![Sashité logo](https://github.com/fixrb/brutal/raw/main/img/sponsor/dark/en/sashite.png#gh-dark-mode-only "Sashité")
![Sashité logo](https://github.com/fixrb/brutal/raw/main/img/sponsor/light/en/sashite.png#gh-light-mode-only "Sashité")
