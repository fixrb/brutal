# frozen_string_literal: false

require 'spectus'
include Spectus

# ------------------------------------------------------------------------------

front_object = "foo"

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MUST raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise unless actual.to_s == "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MUST raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise unless actual.to_s == "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MUST eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected \"FOO\" to eql \"foo\"."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected \"FOO\" to eql \"foo\"."
raise unless actual.to_s == "Failure: expected \"FOO\" to eql \"foo\"."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MUST equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected \"FOO\" to equal 42."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected \"FOO\" to equal 42."
raise unless actual.to_s == "Failure: expected \"FOO\" to equal 42."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.SHOULD raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected \"FOO\" to raise_exception NoMethodError."
raise unless actual.to_sym == :warning
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == true
raise unless actual.char == "\e[33mW\e[0m"
raise unless actual.message == "Warning: expected \"FOO\" to raise_exception NoMethodError."
raise unless actual.to_s == "Warning: expected \"FOO\" to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.SHOULD raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected \"FOO\" to raise_exception ArgumentError."
raise unless actual.to_sym == :warning
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == true
raise unless actual.char == "\e[33mW\e[0m"
raise unless actual.message == "Warning: expected \"FOO\" to raise_exception ArgumentError."
raise unless actual.to_s == "Warning: expected \"FOO\" to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.SHOULD eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected \"FOO\" to eql \"foo\"."
raise unless actual.to_sym == :warning
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == true
raise unless actual.char == "\e[33mW\e[0m"
raise unless actual.message == "Warning: expected \"FOO\" to eql \"foo\"."
raise unless actual.to_s == "Warning: expected \"FOO\" to eql \"foo\"."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.SHOULD equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected \"FOO\" to equal 42."
raise unless actual.to_sym == :warning
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == true
raise unless actual.char == "\e[33mW\e[0m"
raise unless actual.message == "Warning: expected \"FOO\" to equal 42."
raise unless actual.to_s == "Warning: expected \"FOO\" to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MAY raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise unless actual.to_s == "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MAY raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise unless actual.to_s == "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MAY eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected \"FOO\" to eql \"foo\"."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected \"FOO\" to eql \"foo\"."
raise unless actual.to_s == "Failure: expected \"FOO\" to eql \"foo\"."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MAY equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected \"FOO\" to equal 42."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected \"FOO\" to equal 42."
raise unless actual.to_s == "Failure: expected \"FOO\" to equal 42."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MUST_NOT raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise unless actual.to_s == "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MUST_NOT raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise unless actual.to_s == "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MUST_NOT eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected \"FOO\" not to eql \"foo\"."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected \"FOO\" not to eql \"foo\"."
raise unless actual.to_s == "Success: expected \"FOO\" not to eql \"foo\"."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: \"foo\", got: true, matcher: :eql, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MUST_NOT equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected \"FOO\" not to equal 42."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected \"FOO\" not to equal 42."
raise unless actual.to_s == "Success: expected \"FOO\" not to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.SHOULD_NOT raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise unless actual.to_s == "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.SHOULD_NOT raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise unless actual.to_s == "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.SHOULD_NOT eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected \"FOO\" not to eql \"foo\"."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected \"FOO\" not to eql \"foo\"."
raise unless actual.to_s == "Success: expected \"FOO\" not to eql \"foo\"."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: \"foo\", got: true, matcher: :eql, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.SHOULD_NOT equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected \"FOO\" not to equal 42."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected \"FOO\" not to equal 42."
raise unless actual.to_s == "Success: expected \"FOO\" not to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MUST! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise unless actual.to_s == "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MUST! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise unless actual.to_s == "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MUST! eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected \"FOO\" to eql \"foo\"."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected \"FOO\" to eql \"foo\"."
raise unless actual.to_s == "Failure: expected \"FOO\" to eql \"foo\"."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MUST! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected \"FOO\" to equal 42."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected \"FOO\" to equal 42."
raise unless actual.to_s == "Failure: expected \"FOO\" to equal 42."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.SHOULD! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected \"FOO\" to raise_exception NoMethodError."
raise unless actual.to_sym == :warning
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == true
raise unless actual.char == "\e[33mW\e[0m"
raise unless actual.message == "Warning: expected \"FOO\" to raise_exception NoMethodError."
raise unless actual.to_s == "Warning: expected \"FOO\" to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.SHOULD! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected \"FOO\" to raise_exception ArgumentError."
raise unless actual.to_sym == :warning
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == true
raise unless actual.char == "\e[33mW\e[0m"
raise unless actual.message == "Warning: expected \"FOO\" to raise_exception ArgumentError."
raise unless actual.to_s == "Warning: expected \"FOO\" to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.SHOULD! eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected \"FOO\" to eql \"foo\"."
raise unless actual.to_sym == :warning
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == true
raise unless actual.char == "\e[33mW\e[0m"
raise unless actual.message == "Warning: expected \"FOO\" to eql \"foo\"."
raise unless actual.to_s == "Warning: expected \"FOO\" to eql \"foo\"."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.SHOULD! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected \"FOO\" to equal 42."
raise unless actual.to_sym == :warning
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == true
raise unless actual.char == "\e[33mW\e[0m"
raise unless actual.message == "Warning: expected \"FOO\" to equal 42."
raise unless actual.to_s == "Warning: expected \"FOO\" to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MAY! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise unless actual.to_s == "Failure: expected \"FOO\" to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MAY! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise unless actual.to_s == "Failure: expected \"FOO\" to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MAY! eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected \"FOO\" to eql \"foo\"."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected \"FOO\" to eql \"foo\"."
raise unless actual.to_s == "Failure: expected \"FOO\" to eql \"foo\"."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MAY! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected \"FOO\" to equal 42."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected \"FOO\" to equal 42."
raise unless actual.to_s == "Failure: expected \"FOO\" to equal 42."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"FOO\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MUST_NOT! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise unless actual.to_s == "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MUST_NOT! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise unless actual.to_s == "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MUST_NOT! eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected \"FOO\" not to eql \"foo\"."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected \"FOO\" not to eql \"foo\"."
raise unless actual.to_s == "Success: expected \"FOO\" not to eql \"foo\"."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: \"foo\", got: true, matcher: :eql, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.MUST_NOT! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected \"FOO\" not to equal 42."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected \"FOO\" not to equal 42."
raise unless actual.to_s == "Success: expected \"FOO\" not to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.SHOULD_NOT! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise unless actual.to_s == "Success: expected \"FOO\" not to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.SHOULD_NOT! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise unless actual.to_s == "Success: expected \"FOO\" not to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.SHOULD_NOT! eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected \"FOO\" not to eql \"foo\"."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected \"FOO\" not to eql \"foo\"."
raise unless actual.to_s == "Success: expected \"FOO\" not to eql \"foo\"."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: \"foo\", got: true, matcher: :eql, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.upcase }.SHOULD_NOT! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected \"FOO\" not to equal 42."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected \"FOO\" not to equal 42."
raise unless actual.to_s == "Success: expected \"FOO\" not to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"FOO\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MUST raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected \"boo\" to raise_exception NoMethodError."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected \"boo\" to raise_exception NoMethodError."
raise unless actual.to_s == "Failure: expected \"boo\" to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MUST raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected nil to raise_exception ArgumentError."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected nil to raise_exception ArgumentError."
raise unless actual.to_s == "Failure: expected nil to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MUST eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected nil to eql \"foo\"."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected nil to eql \"foo\"."
raise unless actual.to_s == "Failure: expected nil to eql \"foo\"."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MUST equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected nil to equal 42."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected nil to equal 42."
raise unless actual.to_s == "Failure: expected nil to equal 42."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.SHOULD raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected nil to raise_exception NoMethodError."
raise unless actual.to_sym == :warning
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == true
raise unless actual.char == "\e[33mW\e[0m"
raise unless actual.message == "Warning: expected nil to raise_exception NoMethodError."
raise unless actual.to_s == "Warning: expected nil to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.SHOULD raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected nil to raise_exception ArgumentError."
raise unless actual.to_sym == :warning
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == true
raise unless actual.char == "\e[33mW\e[0m"
raise unless actual.message == "Warning: expected nil to raise_exception ArgumentError."
raise unless actual.to_s == "Warning: expected nil to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.SHOULD eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected nil to eql \"foo\"."
raise unless actual.to_sym == :warning
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == true
raise unless actual.char == "\e[33mW\e[0m"
raise unless actual.message == "Warning: expected nil to eql \"foo\"."
raise unless actual.to_s == "Warning: expected nil to eql \"foo\"."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.SHOULD equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected nil to equal 42."
raise unless actual.to_sym == :warning
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == true
raise unless actual.char == "\e[33mW\e[0m"
raise unless actual.message == "Warning: expected nil to equal 42."
raise unless actual.to_s == "Warning: expected nil to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MAY raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected nil to raise_exception NoMethodError."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected nil to raise_exception NoMethodError."
raise unless actual.to_s == "Failure: expected nil to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MAY raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected nil to raise_exception ArgumentError."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected nil to raise_exception ArgumentError."
raise unless actual.to_s == "Failure: expected nil to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MAY eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected nil to eql \"foo\"."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected nil to eql \"foo\"."
raise unless actual.to_s == "Failure: expected nil to eql \"foo\"."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MAY equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected nil to equal 42."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected nil to equal 42."
raise unless actual.to_s == "Failure: expected nil to equal 42."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MUST_NOT raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected nil not to raise_exception NoMethodError."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected nil not to raise_exception NoMethodError."
raise unless actual.to_s == "Success: expected nil not to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MUST_NOT raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected nil not to raise_exception ArgumentError."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected nil not to raise_exception ArgumentError."
raise unless actual.to_s == "Success: expected nil not to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MUST_NOT eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected nil not to eql \"foo\"."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected nil not to eql \"foo\"."
raise unless actual.to_s == "Success: expected nil not to eql \"foo\"."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: \"foo\", got: true, matcher: :eql, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MUST_NOT equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected nil not to equal 42."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected nil not to equal 42."
raise unless actual.to_s == "Success: expected nil not to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.SHOULD_NOT raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected nil not to raise_exception NoMethodError."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected nil not to raise_exception NoMethodError."
raise unless actual.to_s == "Success: expected nil not to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.SHOULD_NOT raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected nil not to raise_exception ArgumentError."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected nil not to raise_exception ArgumentError."
raise unless actual.to_s == "Success: expected nil not to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.SHOULD_NOT eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected nil not to eql \"foo\"."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected nil not to eql \"foo\"."
raise unless actual.to_s == "Success: expected nil not to eql \"foo\"."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: \"foo\", got: true, matcher: :eql, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.SHOULD_NOT equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected nil not to equal 42."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected nil not to equal 42."
raise unless actual.to_s == "Success: expected nil not to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MUST! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected nil to raise_exception NoMethodError."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected nil to raise_exception NoMethodError."
raise unless actual.to_s == "Failure: expected nil to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MUST! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected nil to raise_exception ArgumentError."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected nil to raise_exception ArgumentError."
raise unless actual.to_s == "Failure: expected nil to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MUST! eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected nil to eql \"foo\"."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected nil to eql \"foo\"."
raise unless actual.to_s == "Failure: expected nil to eql \"foo\"."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MUST! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected nil to equal 42."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected nil to equal 42."
raise unless actual.to_s == "Failure: expected nil to equal 42."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.SHOULD! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected nil to raise_exception NoMethodError."
raise unless actual.to_sym == :warning
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == true
raise unless actual.char == "\e[33mW\e[0m"
raise unless actual.message == "Warning: expected nil to raise_exception NoMethodError."
raise unless actual.to_s == "Warning: expected nil to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.SHOULD! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected nil to raise_exception ArgumentError."
raise unless actual.to_sym == :warning
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == true
raise unless actual.char == "\e[33mW\e[0m"
raise unless actual.message == "Warning: expected nil to raise_exception ArgumentError."
raise unless actual.to_s == "Warning: expected nil to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.SHOULD! eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected nil to eql \"foo\"."
raise unless actual.to_sym == :warning
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == true
raise unless actual.char == "\e[33mW\e[0m"
raise unless actual.message == "Warning: expected nil to eql \"foo\"."
raise unless actual.to_s == "Warning: expected nil to eql \"foo\"."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.SHOULD! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected nil to equal 42."
raise unless actual.to_sym == :warning
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == true
raise unless actual.char == "\e[33mW\e[0m"
raise unless actual.message == "Warning: expected nil to equal 42."
raise unless actual.to_s == "Warning: expected nil to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MAY! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected nil to raise_exception NoMethodError."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected nil to raise_exception NoMethodError."
raise unless actual.to_s == "Failure: expected nil to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MAY! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected nil to raise_exception ArgumentError."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected nil to raise_exception ArgumentError."
raise unless actual.to_s == "Failure: expected nil to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MAY! eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected nil to eql \"foo\"."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected nil to eql \"foo\"."
raise unless actual.to_s == "Failure: expected nil to eql \"foo\"."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: nil, expected: \"foo\", got: false, matcher: :eql, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MAY! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected nil to equal 42."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: expected nil to equal 42."
raise unless actual.to_s == "Failure: expected nil to equal 42."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MUST_NOT! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected nil not to raise_exception NoMethodError."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected nil not to raise_exception NoMethodError."
raise unless actual.to_s == "Success: expected nil not to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MUST_NOT! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected nil not to raise_exception ArgumentError."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected nil not to raise_exception ArgumentError."
raise unless actual.to_s == "Success: expected nil not to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MUST_NOT! eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected nil not to eql \"foo\"."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected nil not to eql \"foo\"."
raise unless actual.to_s == "Success: expected nil not to eql \"foo\"."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: \"foo\", got: true, matcher: :eql, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.MUST_NOT! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected nil not to equal 42."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected nil not to equal 42."
raise unless actual.to_s == "Success: expected nil not to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.SHOULD_NOT! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected nil not to raise_exception NoMethodError."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected nil not to raise_exception NoMethodError."
raise unless actual.to_s == "Success: expected nil not to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.SHOULD_NOT! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected nil not to raise_exception ArgumentError."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected nil not to raise_exception ArgumentError."
raise unless actual.to_s == "Success: expected nil not to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.SHOULD_NOT! eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected nil not to eql \"foo\"."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected nil not to eql \"foo\"."
raise unless actual.to_s == "Success: expected nil not to eql \"foo\"."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: \"foo\", got: true, matcher: :eql, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.gsub!('f', 'b') }.SHOULD_NOT! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected nil not to equal 42."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: expected nil not to equal 42."
raise unless actual.to_s == "Success: expected nil not to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MUST raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "Success: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"boo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NoMethodError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MUST raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MUST eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MUST equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.SHOULD raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "Success: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"boo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NoMethodError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.SHOULD raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.SHOULD eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.SHOULD equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MAY raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Success: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "Success: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"boo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, level: :MAY, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NoMethodError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MAY raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :info
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == true
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[36mI\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[36mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MAY eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :info
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == true
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[36mI\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[36mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MAY equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :info
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == true
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[36mI\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[36mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MUST_NOT raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "Failure: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: #<NoMethodError: undefined method `boom' for \"boo\":String>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == NoMethodError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MUST_NOT raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MUST_NOT eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: \"foo\", got: nil, matcher: :eql, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MUST_NOT equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: 42, got: nil, matcher: :equal, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.SHOULD_NOT raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :warning
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == true
raise unless actual.char == "\e[33mW\e[0m"
raise unless actual.message == "Warning: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "Warning: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"boo\":String>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == NoMethodError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.SHOULD_NOT raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.SHOULD_NOT eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: \"foo\", got: nil, matcher: :eql, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.SHOULD_NOT equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: 42, got: nil, matcher: :equal, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MUST! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "Success: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"boo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NoMethodError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MUST! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MUST! eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MUST! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.SHOULD! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "Success: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"boo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NoMethodError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.SHOULD! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.SHOULD! eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.SHOULD! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MAY! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Success: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "Success: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"boo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, level: :MAY, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NoMethodError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MAY! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :info
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == true
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[36mI\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[36mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MAY! eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :info
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == true
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[36mI\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[36mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MAY! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :info
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == true
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[36mI\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[36mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MUST_NOT! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "Failure: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: #<NoMethodError: undefined method `boom' for \"boo\":String>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == NoMethodError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MUST_NOT! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MUST_NOT! eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: \"foo\", got: nil, matcher: :eql, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.MUST_NOT! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: 42, got: nil, matcher: :equal, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.SHOULD_NOT! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :warning
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == true
raise unless actual.char == "\e[33mW\e[0m"
raise unless actual.message == "Warning: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "Warning: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"boo\":String>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == NoMethodError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.SHOULD_NOT! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.SHOULD_NOT! eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: \"foo\", got: nil, matcher: :eql, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.boom }.SHOULD_NOT! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"boo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"boo\":String>, expected: 42, got: nil, matcher: :equal, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MUST raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MUST raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "Success: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MUST eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MUST equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.SHOULD raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.SHOULD raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "Success: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.SHOULD eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.SHOULD equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MAY raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MAY raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Success: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "Success: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, level: :MAY, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MAY eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MAY equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MUST_NOT raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MUST_NOT raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "Failure: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MUST_NOT eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, matcher: :eql, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MUST_NOT equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.SHOULD_NOT raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.SHOULD_NOT raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :warning
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == true
raise unless actual.char == "\e[33mW\e[0m"
raise unless actual.message == "Warning: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "Warning: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.SHOULD_NOT eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, matcher: :eql, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.SHOULD_NOT equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MUST! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MUST! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "Success: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MUST! eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MUST! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.SHOULD! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.SHOULD! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "Success: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.SHOULD! eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.SHOULD! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MAY! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MAY! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Success: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :success
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == true
raise unless actual.valid? == true
raise unless actual.warning? == false
raise unless actual.char == "\e[32m.\e[0m"
raise unless actual.message == "Success: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "Success: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: false, level: :MAY, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MAY! eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, matcher: :eql, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MAY! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == false
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MUST_NOT! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MUST_NOT! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :failure
raise unless actual.error? == false
raise unless actual.failure? == true
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[35mF\e[0m"
raise unless actual.message == "Failure: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "Failure: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MUST_NOT! eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, matcher: :eql, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.MUST_NOT! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.SHOULD_NOT! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: NoMethodError, got: nil, matcher: :raise_exception, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.SHOULD_NOT! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :warning
raise unless actual.error? == false
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == false
raise unless actual.passed? == true
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == true
raise unless actual.char == "\e[33mW\e[0m"
raise unless actual.message == "Warning: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "Warning: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.SHOULD_NOT! eql('foo')
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: \"foo\", got: nil, matcher: :eql, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { front_object.empty?(4) }.SHOULD_NOT! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_sym == :error
raise unless actual.error? == true
raise unless actual.failure? == false
raise unless actual.info? == false
raise unless actual.negate? == true
raise unless actual.failed? == true
raise unless actual.passed? == false
raise unless actual.success? == false
raise unless actual.valid? == false
raise unless actual.warning? == false
raise unless actual.char == "\e[31mE\e[0m"
raise unless actual.message == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.to_s == "ArgumentError: wrong number of arguments (given 1, expected 0)."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<ArgumentError: wrong number of arguments (given 1, expected 0)>, expected: 42, got: nil, matcher: :equal, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == ArgumentError
raise unless actual.got.class == NilClass
