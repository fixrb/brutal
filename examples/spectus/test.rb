# frozen_string_literal: false

require 'spectus'
include Spectus

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.MUST raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected 42 to raise_exception NoMethodError."
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
raise unless actual.message == "Failure: expected 42 to raise_exception NoMethodError."
raise unless actual.to_s == "Failure: expected 42 to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: 42, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.MUST raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected 42 to raise_exception ArgumentError."
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
raise unless actual.message == "Failure: expected 42 to raise_exception ArgumentError."
raise unless actual.to_s == "Failure: expected 42 to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: 42, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.MUST equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected to equal 42."
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
raise unless actual.message == "Success: expected to equal 42."
raise unless actual.to_s == "Success: expected to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: 42, got: true, matcher: :equal, negate: false, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.SHOULD raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected 42 to raise_exception NoMethodError."
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
raise unless actual.message == "Warning: expected 42 to raise_exception NoMethodError."
raise unless actual.to_s == "Warning: expected 42 to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.SHOULD raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected 42 to raise_exception ArgumentError."
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
raise unless actual.message == "Warning: expected 42 to raise_exception ArgumentError."
raise unless actual.to_s == "Warning: expected 42 to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.SHOULD equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected to equal 42."
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
raise unless actual.message == "Success: expected to equal 42."
raise unless actual.to_s == "Success: expected to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: 42, got: true, matcher: :equal, negate: false, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.MAY raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected 42 to raise_exception NoMethodError."
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
raise unless actual.message == "Failure: expected 42 to raise_exception NoMethodError."
raise unless actual.to_s == "Failure: expected 42 to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: 42, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.MAY raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected 42 to raise_exception ArgumentError."
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
raise unless actual.message == "Failure: expected 42 to raise_exception ArgumentError."
raise unless actual.to_s == "Failure: expected 42 to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: 42, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.MAY equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Success: expected to equal 42."
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
raise unless actual.message == "Success: expected to equal 42."
raise unless actual.to_s == "Success: expected to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: 42, got: true, matcher: :equal, negate: false, level: :MAY, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.MUST_NOT raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected 42 not to raise_exception NoMethodError."
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
raise unless actual.message == "Success: expected 42 not to raise_exception NoMethodError."
raise unless actual.to_s == "Success: expected 42 not to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.MUST_NOT raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected 42 not to raise_exception ArgumentError."
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
raise unless actual.message == "Success: expected 42 not to raise_exception ArgumentError."
raise unless actual.to_s == "Success: expected 42 not to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.MUST_NOT equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected not to equal 42."
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
raise unless actual.message == "Failure: expected not to equal 42."
raise unless actual.to_s == "Failure: expected not to equal 42."
raise unless actual.inspect == "Spectus::Result::Fail(actual: 42, error: nil, expected: 42, got: false, matcher: :equal, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.SHOULD_NOT raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected 42 not to raise_exception NoMethodError."
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
raise unless actual.message == "Success: expected 42 not to raise_exception NoMethodError."
raise unless actual.to_s == "Success: expected 42 not to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.SHOULD_NOT raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected 42 not to raise_exception ArgumentError."
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
raise unless actual.message == "Success: expected 42 not to raise_exception ArgumentError."
raise unless actual.to_s == "Success: expected 42 not to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.SHOULD_NOT equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected not to equal 42."
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
raise unless actual.message == "Warning: expected not to equal 42."
raise unless actual.to_s == "Warning: expected not to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: 42, got: false, matcher: :equal, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.MUST! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected 42 to raise_exception NoMethodError."
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
raise unless actual.message == "Failure: expected 42 to raise_exception NoMethodError."
raise unless actual.to_s == "Failure: expected 42 to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: 42, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.MUST! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected 42 to raise_exception ArgumentError."
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
raise unless actual.message == "Failure: expected 42 to raise_exception ArgumentError."
raise unless actual.to_s == "Failure: expected 42 to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: 42, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.MUST! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected to equal 42."
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
raise unless actual.message == "Success: expected to equal 42."
raise unless actual.to_s == "Success: expected to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: 42, got: true, matcher: :equal, negate: false, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.SHOULD! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected 42 to raise_exception NoMethodError."
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
raise unless actual.message == "Warning: expected 42 to raise_exception NoMethodError."
raise unless actual.to_s == "Warning: expected 42 to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.SHOULD! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected 42 to raise_exception ArgumentError."
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
raise unless actual.message == "Warning: expected 42 to raise_exception ArgumentError."
raise unless actual.to_s == "Warning: expected 42 to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.SHOULD! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected to equal 42."
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
raise unless actual.message == "Success: expected to equal 42."
raise unless actual.to_s == "Success: expected to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: 42, got: true, matcher: :equal, negate: false, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.MAY! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected 42 to raise_exception NoMethodError."
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
raise unless actual.message == "Failure: expected 42 to raise_exception NoMethodError."
raise unless actual.to_s == "Failure: expected 42 to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: 42, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.MAY! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected 42 to raise_exception ArgumentError."
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
raise unless actual.message == "Failure: expected 42 to raise_exception ArgumentError."
raise unless actual.to_s == "Failure: expected 42 to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: 42, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.MAY! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Success: expected to equal 42."
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
raise unless actual.message == "Success: expected to equal 42."
raise unless actual.to_s == "Success: expected to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: 42, got: true, matcher: :equal, negate: false, level: :MAY, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.MUST_NOT! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected 42 not to raise_exception NoMethodError."
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
raise unless actual.message == "Success: expected 42 not to raise_exception NoMethodError."
raise unless actual.to_s == "Success: expected 42 not to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.MUST_NOT! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected 42 not to raise_exception ArgumentError."
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
raise unless actual.message == "Success: expected 42 not to raise_exception ArgumentError."
raise unless actual.to_s == "Success: expected 42 not to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.MUST_NOT! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected not to equal 42."
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
raise unless actual.message == "Failure: expected not to equal 42."
raise unless actual.to_s == "Failure: expected not to equal 42."
raise unless actual.inspect == "Spectus::Result::Fail(actual: 42, error: nil, expected: 42, got: false, matcher: :equal, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.SHOULD_NOT! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected 42 not to raise_exception NoMethodError."
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
raise unless actual.message == "Success: expected 42 not to raise_exception NoMethodError."
raise unless actual.to_s == "Success: expected 42 not to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.SHOULD_NOT! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected 42 not to raise_exception ArgumentError."
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
raise unless actual.message == "Success: expected 42 not to raise_exception ArgumentError."
raise unless actual.to_s == "Success: expected 42 not to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 42 }.SHOULD_NOT! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected not to equal 42."
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
raise unless actual.message == "Warning: expected not to equal 42."
raise unless actual.to_s == "Warning: expected not to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: 42, error: nil, expected: 42, got: false, matcher: :equal, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == Integer
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.upcase }.MUST raise_exception(NoMethodError)
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
  it { 'foo'.upcase }.MUST raise_exception(ArgumentError)
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
  it { 'foo'.upcase }.MUST equal(42)
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
  it { 'foo'.upcase }.SHOULD raise_exception(NoMethodError)
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
  it { 'foo'.upcase }.SHOULD raise_exception(ArgumentError)
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
  it { 'foo'.upcase }.SHOULD equal(42)
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
  it { 'foo'.upcase }.MAY raise_exception(NoMethodError)
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
  it { 'foo'.upcase }.MAY raise_exception(ArgumentError)
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
  it { 'foo'.upcase }.MAY equal(42)
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
  it { 'foo'.upcase }.MUST_NOT raise_exception(NoMethodError)
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
  it { 'foo'.upcase }.MUST_NOT raise_exception(ArgumentError)
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
  it { 'foo'.upcase }.MUST_NOT equal(42)
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
  it { 'foo'.upcase }.SHOULD_NOT raise_exception(NoMethodError)
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
  it { 'foo'.upcase }.SHOULD_NOT raise_exception(ArgumentError)
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
  it { 'foo'.upcase }.SHOULD_NOT equal(42)
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
  it { 'foo'.upcase }.MUST! raise_exception(NoMethodError)
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
  it { 'foo'.upcase }.MUST! raise_exception(ArgumentError)
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
  it { 'foo'.upcase }.MUST! equal(42)
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
  it { 'foo'.upcase }.SHOULD! raise_exception(NoMethodError)
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
  it { 'foo'.upcase }.SHOULD! raise_exception(ArgumentError)
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
  it { 'foo'.upcase }.SHOULD! equal(42)
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
  it { 'foo'.upcase }.MAY! raise_exception(NoMethodError)
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
  it { 'foo'.upcase }.MAY! raise_exception(ArgumentError)
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
  it { 'foo'.upcase }.MAY! equal(42)
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
  it { 'foo'.upcase }.MUST_NOT! raise_exception(NoMethodError)
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
  it { 'foo'.upcase }.MUST_NOT! raise_exception(ArgumentError)
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
  it { 'foo'.upcase }.MUST_NOT! equal(42)
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
  it { 'foo'.upcase }.SHOULD_NOT! raise_exception(NoMethodError)
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
  it { 'foo'.upcase }.SHOULD_NOT! raise_exception(ArgumentError)
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
  it { 'foo'.upcase }.SHOULD_NOT! equal(42)
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
  it { 'foo'.gsub!('f', 'b') }.MUST raise_exception(NoMethodError)
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
  it { 'foo'.gsub!('f', 'b') }.MUST raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected \"boo\" to raise_exception ArgumentError."
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
raise unless actual.message == "Failure: expected \"boo\" to raise_exception ArgumentError."
raise unless actual.to_s == "Failure: expected \"boo\" to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.MUST equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected \"boo\" to equal 42."
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
raise unless actual.message == "Failure: expected \"boo\" to equal 42."
raise unless actual.to_s == "Failure: expected \"boo\" to equal 42."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.SHOULD raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected \"boo\" to raise_exception NoMethodError."
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
raise unless actual.message == "Warning: expected \"boo\" to raise_exception NoMethodError."
raise unless actual.to_s == "Warning: expected \"boo\" to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.SHOULD raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected \"boo\" to raise_exception ArgumentError."
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
raise unless actual.message == "Warning: expected \"boo\" to raise_exception ArgumentError."
raise unless actual.to_s == "Warning: expected \"boo\" to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.SHOULD equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected \"boo\" to equal 42."
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
raise unless actual.message == "Warning: expected \"boo\" to equal 42."
raise unless actual.to_s == "Warning: expected \"boo\" to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.MAY raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
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
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.MAY raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected \"boo\" to raise_exception ArgumentError."
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
raise unless actual.message == "Failure: expected \"boo\" to raise_exception ArgumentError."
raise unless actual.to_s == "Failure: expected \"boo\" to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.MAY equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected \"boo\" to equal 42."
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
raise unless actual.message == "Failure: expected \"boo\" to equal 42."
raise unless actual.to_s == "Failure: expected \"boo\" to equal 42."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.MUST_NOT raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected \"boo\" not to raise_exception NoMethodError."
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
raise unless actual.message == "Success: expected \"boo\" not to raise_exception NoMethodError."
raise unless actual.to_s == "Success: expected \"boo\" not to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.MUST_NOT raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected \"boo\" not to raise_exception ArgumentError."
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
raise unless actual.message == "Success: expected \"boo\" not to raise_exception ArgumentError."
raise unless actual.to_s == "Success: expected \"boo\" not to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.MUST_NOT equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected \"boo\" not to equal 42."
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
raise unless actual.message == "Success: expected \"boo\" not to equal 42."
raise unless actual.to_s == "Success: expected \"boo\" not to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.SHOULD_NOT raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected \"boo\" not to raise_exception NoMethodError."
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
raise unless actual.message == "Success: expected \"boo\" not to raise_exception NoMethodError."
raise unless actual.to_s == "Success: expected \"boo\" not to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.SHOULD_NOT raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected \"boo\" not to raise_exception ArgumentError."
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
raise unless actual.message == "Success: expected \"boo\" not to raise_exception ArgumentError."
raise unless actual.to_s == "Success: expected \"boo\" not to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.SHOULD_NOT equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected \"boo\" not to equal 42."
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
raise unless actual.message == "Success: expected \"boo\" not to equal 42."
raise unless actual.to_s == "Success: expected \"boo\" not to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.MUST! raise_exception(NoMethodError)
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
  it { 'foo'.gsub!('f', 'b') }.MUST! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected \"boo\" to raise_exception ArgumentError."
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
raise unless actual.message == "Failure: expected \"boo\" to raise_exception ArgumentError."
raise unless actual.to_s == "Failure: expected \"boo\" to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.MUST! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected \"boo\" to equal 42."
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
raise unless actual.message == "Failure: expected \"boo\" to equal 42."
raise unless actual.to_s == "Failure: expected \"boo\" to equal 42."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.SHOULD! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected \"boo\" to raise_exception NoMethodError."
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
raise unless actual.message == "Warning: expected \"boo\" to raise_exception NoMethodError."
raise unless actual.to_s == "Warning: expected \"boo\" to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.SHOULD! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected \"boo\" to raise_exception ArgumentError."
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
raise unless actual.message == "Warning: expected \"boo\" to raise_exception ArgumentError."
raise unless actual.to_s == "Warning: expected \"boo\" to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.SHOULD! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected \"boo\" to equal 42."
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
raise unless actual.message == "Warning: expected \"boo\" to equal 42."
raise unless actual.to_s == "Warning: expected \"boo\" to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.MAY! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
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
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.MAY! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected \"boo\" to raise_exception ArgumentError."
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
raise unless actual.message == "Failure: expected \"boo\" to raise_exception ArgumentError."
raise unless actual.to_s == "Failure: expected \"boo\" to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.MAY! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected \"boo\" to equal 42."
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
raise unless actual.message == "Failure: expected \"boo\" to equal 42."
raise unless actual.to_s == "Failure: expected \"boo\" to equal 42."
raise unless actual.inspect == "Spectus::Result::Fail(actual: \"boo\", error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.MUST_NOT! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected \"boo\" not to raise_exception NoMethodError."
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
raise unless actual.message == "Success: expected \"boo\" not to raise_exception NoMethodError."
raise unless actual.to_s == "Success: expected \"boo\" not to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.MUST_NOT! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected \"boo\" not to raise_exception ArgumentError."
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
raise unless actual.message == "Success: expected \"boo\" not to raise_exception ArgumentError."
raise unless actual.to_s == "Success: expected \"boo\" not to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.MUST_NOT! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected \"boo\" not to equal 42."
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
raise unless actual.message == "Success: expected \"boo\" not to equal 42."
raise unless actual.to_s == "Success: expected \"boo\" not to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.SHOULD_NOT! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected \"boo\" not to raise_exception NoMethodError."
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
raise unless actual.message == "Success: expected \"boo\" not to raise_exception NoMethodError."
raise unless actual.to_s == "Success: expected \"boo\" not to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.SHOULD_NOT! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected \"boo\" not to raise_exception ArgumentError."
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
raise unless actual.message == "Success: expected \"boo\" not to raise_exception ArgumentError."
raise unless actual.to_s == "Success: expected \"boo\" not to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.gsub!('f', 'b') }.SHOULD_NOT! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected \"boo\" not to equal 42."
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
raise unless actual.message == "Success: expected \"boo\" not to equal 42."
raise unless actual.to_s == "Success: expected \"boo\" not to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: \"boo\", error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == String
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.MUST raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "Success: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "Success: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NoMethodError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.MUST raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.MUST equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.SHOULD raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "Success: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "Success: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NoMethodError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.SHOULD raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.SHOULD equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.MAY raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Success: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "Success: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "Success: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, level: :MAY, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NoMethodError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.MAY raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[36mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.MAY equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[36mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.MUST_NOT raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "Failure: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "Failure: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == NoMethodError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.MUST_NOT raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.MUST_NOT equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.SHOULD_NOT raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "Warning: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "Warning: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == NoMethodError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.SHOULD_NOT raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.SHOULD_NOT equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.MUST! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "Success: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "Success: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NoMethodError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.MUST! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.MUST! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.SHOULD! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "Success: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "Success: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NoMethodError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.SHOULD! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.SHOULD! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.MAY! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Success: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "Success: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "Success: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: false, level: :MAY, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == NoMethodError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.MAY! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[36mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.MAY! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[36mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.MUST_NOT! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "Failure: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "Failure: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == NoMethodError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.MUST_NOT! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.MUST_NOT! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: true, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.SHOULD_NOT! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "Warning: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "Warning: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<NoMethodError: undefined method `boom' for \"foo\":String>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == NoMethodError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.SHOULD_NOT! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: ArgumentError, got: nil, matcher: :raise_exception, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.boom }.SHOULD_NOT! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
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
raise unless actual.message == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.to_s == "NoMethodError: undefined method `boom' for \"foo\":String."
raise unless actual.inspect == "Spectus::Result::Fail(actual: nil, error: #<NoMethodError: undefined method `boom' for \"foo\":String>, expected: 42, got: nil, matcher: :equal, negate: true, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[31mfoo\e[0m"
raise unless actual.actual.class == NilClass
raise unless actual.error.class == NoMethodError
raise unless actual.got.class == NilClass

# ------------------------------------------------------------------------------

actual = begin
  it { 'foo'.empty?(4) }.MUST raise_exception(NoMethodError)
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
  it { 'foo'.empty?(4) }.MUST raise_exception(ArgumentError)
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
  it { 'foo'.empty?(4) }.MUST equal(42)
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
  it { 'foo'.empty?(4) }.SHOULD raise_exception(NoMethodError)
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
  it { 'foo'.empty?(4) }.SHOULD raise_exception(ArgumentError)
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
  it { 'foo'.empty?(4) }.SHOULD equal(42)
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
  it { 'foo'.empty?(4) }.MAY raise_exception(NoMethodError)
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
  it { 'foo'.empty?(4) }.MAY raise_exception(ArgumentError)
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
  it { 'foo'.empty?(4) }.MAY equal(42)
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
  it { 'foo'.empty?(4) }.MUST_NOT raise_exception(NoMethodError)
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
  it { 'foo'.empty?(4) }.MUST_NOT raise_exception(ArgumentError)
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
  it { 'foo'.empty?(4) }.MUST_NOT equal(42)
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
  it { 'foo'.empty?(4) }.SHOULD_NOT raise_exception(NoMethodError)
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
  it { 'foo'.empty?(4) }.SHOULD_NOT raise_exception(ArgumentError)
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
  it { 'foo'.empty?(4) }.SHOULD_NOT equal(42)
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
  it { 'foo'.empty?(4) }.MUST! raise_exception(NoMethodError)
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
  it { 'foo'.empty?(4) }.MUST! raise_exception(ArgumentError)
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
  it { 'foo'.empty?(4) }.MUST! equal(42)
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
  it { 'foo'.empty?(4) }.SHOULD! raise_exception(NoMethodError)
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
  it { 'foo'.empty?(4) }.SHOULD! raise_exception(ArgumentError)
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
  it { 'foo'.empty?(4) }.SHOULD! equal(42)
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
  it { 'foo'.empty?(4) }.MAY! raise_exception(NoMethodError)
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
  it { 'foo'.empty?(4) }.MAY! raise_exception(ArgumentError)
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
  it { 'foo'.empty?(4) }.MAY! equal(42)
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
  it { 'foo'.empty?(4) }.MUST_NOT! raise_exception(NoMethodError)
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
  it { 'foo'.empty?(4) }.MUST_NOT! raise_exception(ArgumentError)
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
  it { 'foo'.empty?(4) }.MUST_NOT! equal(42)
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
  it { 'foo'.empty?(4) }.SHOULD_NOT! raise_exception(NoMethodError)
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
  it { 'foo'.empty?(4) }.SHOULD_NOT! raise_exception(ArgumentError)
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
  it { 'foo'.empty?(4) }.SHOULD_NOT! equal(42)
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
  it { ArgumentError.new }.MUST raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: ArgumentError."
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
raise unless actual.message == "Failure: ArgumentError."
raise unless actual.to_s == "Failure: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.MUST raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: ArgumentError."
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
raise unless actual.message == "Failure: ArgumentError."
raise unless actual.to_s == "Failure: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.MUST equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: ArgumentError."
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
raise unless actual.message == "Failure: ArgumentError."
raise unless actual.to_s == "Failure: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.SHOULD raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: ArgumentError."
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
raise unless actual.message == "Warning: ArgumentError."
raise unless actual.to_s == "Warning: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.SHOULD raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: ArgumentError."
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
raise unless actual.message == "Warning: ArgumentError."
raise unless actual.to_s == "Warning: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.SHOULD equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: ArgumentError."
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
raise unless actual.message == "Warning: ArgumentError."
raise unless actual.to_s == "Warning: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.MAY raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: ArgumentError."
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
raise unless actual.message == "Failure: ArgumentError."
raise unless actual.to_s == "Failure: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.MAY raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: ArgumentError."
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
raise unless actual.message == "Failure: ArgumentError."
raise unless actual.to_s == "Failure: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.MAY equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: ArgumentError."
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
raise unless actual.message == "Failure: ArgumentError."
raise unless actual.to_s == "Failure: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.MUST_NOT raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: ArgumentError."
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
raise unless actual.message == "Success: ArgumentError."
raise unless actual.to_s == "Success: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.MUST_NOT raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: ArgumentError."
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
raise unless actual.message == "Success: ArgumentError."
raise unless actual.to_s == "Success: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.MUST_NOT equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: ArgumentError."
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
raise unless actual.message == "Success: ArgumentError."
raise unless actual.to_s == "Success: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.SHOULD_NOT raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: ArgumentError."
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
raise unless actual.message == "Success: ArgumentError."
raise unless actual.to_s == "Success: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.SHOULD_NOT raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: ArgumentError."
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
raise unless actual.message == "Success: ArgumentError."
raise unless actual.to_s == "Success: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.SHOULD_NOT equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: ArgumentError."
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
raise unless actual.message == "Success: ArgumentError."
raise unless actual.to_s == "Success: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.MUST! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: ArgumentError."
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
raise unless actual.message == "Failure: ArgumentError."
raise unless actual.to_s == "Failure: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.MUST! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: ArgumentError."
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
raise unless actual.message == "Failure: ArgumentError."
raise unless actual.to_s == "Failure: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.MUST! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: ArgumentError."
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
raise unless actual.message == "Failure: ArgumentError."
raise unless actual.to_s == "Failure: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.SHOULD! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: ArgumentError."
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
raise unless actual.message == "Warning: ArgumentError."
raise unless actual.to_s == "Warning: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.SHOULD! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: ArgumentError."
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
raise unless actual.message == "Warning: ArgumentError."
raise unless actual.to_s == "Warning: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.SHOULD! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: ArgumentError."
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
raise unless actual.message == "Warning: ArgumentError."
raise unless actual.to_s == "Warning: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.MAY! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: ArgumentError."
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
raise unless actual.message == "Failure: ArgumentError."
raise unless actual.to_s == "Failure: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.MAY! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: ArgumentError."
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
raise unless actual.message == "Failure: ArgumentError."
raise unless actual.to_s == "Failure: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.MAY! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: ArgumentError."
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
raise unless actual.message == "Failure: ArgumentError."
raise unless actual.to_s == "Failure: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: #<ArgumentError: ArgumentError>, error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.MUST_NOT! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: ArgumentError."
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
raise unless actual.message == "Success: ArgumentError."
raise unless actual.to_s == "Success: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.MUST_NOT! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: ArgumentError."
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
raise unless actual.message == "Success: ArgumentError."
raise unless actual.to_s == "Success: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.MUST_NOT! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: ArgumentError."
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
raise unless actual.message == "Success: ArgumentError."
raise unless actual.to_s == "Success: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.SHOULD_NOT! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: ArgumentError."
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
raise unless actual.message == "Success: ArgumentError."
raise unless actual.to_s == "Success: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.SHOULD_NOT! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: ArgumentError."
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
raise unless actual.message == "Success: ArgumentError."
raise unless actual.to_s == "Success: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { ArgumentError.new }.SHOULD_NOT! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: ArgumentError."
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
raise unless actual.message == "Success: ArgumentError."
raise unless actual.to_s == "Success: ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: #<ArgumentError: ArgumentError>, error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == ArgumentError
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.MUST raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected Exception to raise_exception NoMethodError."
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
raise unless actual.message == "Failure: expected Exception to raise_exception NoMethodError."
raise unless actual.to_s == "Failure: expected Exception to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.MUST raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected Exception to raise_exception ArgumentError."
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
raise unless actual.message == "Failure: expected Exception to raise_exception ArgumentError."
raise unless actual.to_s == "Failure: expected Exception to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.MUST equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected Exception to equal 42."
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
raise unless actual.message == "Failure: expected Exception to equal 42."
raise unless actual.to_s == "Failure: expected Exception to equal 42."
raise unless actual.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.SHOULD raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected Exception to raise_exception NoMethodError."
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
raise unless actual.message == "Warning: expected Exception to raise_exception NoMethodError."
raise unless actual.to_s == "Warning: expected Exception to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.SHOULD raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected Exception to raise_exception ArgumentError."
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
raise unless actual.message == "Warning: expected Exception to raise_exception ArgumentError."
raise unless actual.to_s == "Warning: expected Exception to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.SHOULD equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected Exception to equal 42."
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
raise unless actual.message == "Warning: expected Exception to equal 42."
raise unless actual.to_s == "Warning: expected Exception to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.MAY raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected Exception to raise_exception NoMethodError."
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
raise unless actual.message == "Failure: expected Exception to raise_exception NoMethodError."
raise unless actual.to_s == "Failure: expected Exception to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.MAY raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected Exception to raise_exception ArgumentError."
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
raise unless actual.message == "Failure: expected Exception to raise_exception ArgumentError."
raise unless actual.to_s == "Failure: expected Exception to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.MAY equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected Exception to equal 42."
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
raise unless actual.message == "Failure: expected Exception to equal 42."
raise unless actual.to_s == "Failure: expected Exception to equal 42."
raise unless actual.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.MUST_NOT raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected Exception not to raise_exception NoMethodError."
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
raise unless actual.message == "Success: expected Exception not to raise_exception NoMethodError."
raise unless actual.to_s == "Success: expected Exception not to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.MUST_NOT raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected Exception not to raise_exception ArgumentError."
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
raise unless actual.message == "Success: expected Exception not to raise_exception ArgumentError."
raise unless actual.to_s == "Success: expected Exception not to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.MUST_NOT equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected Exception not to equal 42."
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
raise unless actual.message == "Success: expected Exception not to equal 42."
raise unless actual.to_s == "Success: expected Exception not to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.SHOULD_NOT raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected Exception not to raise_exception NoMethodError."
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
raise unless actual.message == "Success: expected Exception not to raise_exception NoMethodError."
raise unless actual.to_s == "Success: expected Exception not to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.SHOULD_NOT raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected Exception not to raise_exception ArgumentError."
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
raise unless actual.message == "Success: expected Exception not to raise_exception ArgumentError."
raise unless actual.to_s == "Success: expected Exception not to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.SHOULD_NOT equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected Exception not to equal 42."
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
raise unless actual.message == "Success: expected Exception not to equal 42."
raise unless actual.to_s == "Success: expected Exception not to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.MUST! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected Exception to raise_exception NoMethodError."
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
raise unless actual.message == "Failure: expected Exception to raise_exception NoMethodError."
raise unless actual.to_s == "Failure: expected Exception to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.MUST! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected Exception to raise_exception ArgumentError."
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
raise unless actual.message == "Failure: expected Exception to raise_exception ArgumentError."
raise unless actual.to_s == "Failure: expected Exception to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.MUST! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Failure: expected Exception to equal 42."
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
raise unless actual.message == "Failure: expected Exception to equal 42."
raise unless actual.to_s == "Failure: expected Exception to equal 42."
raise unless actual.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MUST, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.SHOULD! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected Exception to raise_exception NoMethodError."
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
raise unless actual.message == "Warning: expected Exception to raise_exception NoMethodError."
raise unless actual.to_s == "Warning: expected Exception to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.SHOULD! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected Exception to raise_exception ArgumentError."
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
raise unless actual.message == "Warning: expected Exception to raise_exception ArgumentError."
raise unless actual.to_s == "Warning: expected Exception to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.SHOULD! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Warning: expected Exception to equal 42."
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
raise unless actual.message == "Warning: expected Exception to equal 42."
raise unless actual.to_s == "Warning: expected Exception to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :SHOULD, valid: false)"
raise unless actual.color('foo') == "\e[33mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.MAY! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected Exception to raise_exception NoMethodError."
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
raise unless actual.message == "Failure: expected Exception to raise_exception NoMethodError."
raise unless actual.to_s == "Failure: expected Exception to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: NoMethodError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.MAY! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected Exception to raise_exception ArgumentError."
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
raise unless actual.message == "Failure: expected Exception to raise_exception ArgumentError."
raise unless actual.to_s == "Failure: expected Exception to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: ArgumentError, got: false, matcher: :raise_exception, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.MAY! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MAY
raise unless actual.to_s == "Failure: expected Exception to equal 42."
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
raise unless actual.message == "Failure: expected Exception to equal 42."
raise unless actual.to_s == "Failure: expected Exception to equal 42."
raise unless actual.inspect == "Spectus::Result::Fail(actual: Exception, error: nil, expected: 42, got: false, matcher: :equal, negate: false, level: :MAY, valid: false)"
raise unless actual.color('foo') == "\e[35mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == FalseClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.MUST_NOT! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected Exception not to raise_exception NoMethodError."
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
raise unless actual.message == "Success: expected Exception not to raise_exception NoMethodError."
raise unless actual.to_s == "Success: expected Exception not to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.MUST_NOT! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected Exception not to raise_exception ArgumentError."
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
raise unless actual.message == "Success: expected Exception not to raise_exception ArgumentError."
raise unless actual.to_s == "Success: expected Exception not to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.MUST_NOT! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :MUST
raise unless actual.to_s == "Success: expected Exception not to equal 42."
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
raise unless actual.message == "Success: expected Exception not to equal 42."
raise unless actual.to_s == "Success: expected Exception not to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :MUST, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.SHOULD_NOT! raise_exception(NoMethodError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected Exception not to raise_exception NoMethodError."
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
raise unless actual.message == "Success: expected Exception not to raise_exception NoMethodError."
raise unless actual.to_s == "Success: expected Exception not to raise_exception NoMethodError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: NoMethodError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.SHOULD_NOT! raise_exception(ArgumentError)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected Exception not to raise_exception ArgumentError."
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
raise unless actual.message == "Success: expected Exception not to raise_exception ArgumentError."
raise unless actual.to_s == "Success: expected Exception not to raise_exception ArgumentError."
raise unless actual.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: ArgumentError, got: true, matcher: :raise_exception, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass

# ------------------------------------------------------------------------------

actual = begin
  it { Exception }.SHOULD_NOT! equal(42)
rescue ::Spectus::Result::Fail => e
  e
end

raise unless actual.level == :SHOULD
raise unless actual.to_s == "Success: expected Exception not to equal 42."
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
raise unless actual.message == "Success: expected Exception not to equal 42."
raise unless actual.to_s == "Success: expected Exception not to equal 42."
raise unless actual.inspect == "Spectus::Result::Pass(actual: Exception, error: nil, expected: 42, got: true, matcher: :equal, negate: true, level: :SHOULD, valid: true)"
raise unless actual.color('foo') == "\e[32mfoo\e[0m"
raise unless actual.actual.class == Class
raise unless actual.error.class == NilClass
raise unless actual.got.class == TrueClass
