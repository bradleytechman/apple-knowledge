# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `rspec-support` gem.
# Please instead update this file by running `bin/tapioca gem rspec-support`.

# Share the top-level RSpec namespace, because we are a core supported
# extension.
module RSpec
  extend ::RSpec::Support::Warnings

  class << self
    # Used to ensure examples get reloaded between multiple runs in the same
    # process and ensures user configuration is persisted.
    #
    # Users must invoke this if they want to clear all examples but preserve
    # current configuration when they use the runner multiple times within the
    # same process.
    def clear_examples; end

    # Returns the global [Configuration](RSpec/Core/Configuration) object. While
    # you _can_ use this method to access the configuration, the more common
    # convention is to use [RSpec.configure](RSpec#configure-class_method).
    #
    # @example
    #   RSpec.configuration.drb_port = 1234
    # @see RSpec.configure
    # @see Core::Configuration
    def configuration; end

    # Setters for shared global objects
    #
    # @api private
    def configuration=(_arg0); end

    # Yields the global configuration to a block.
    #
    # @example
    #   RSpec.configure do |config|
    #   config.add_formatter 'documentation'
    #   end
    # @see Core::Configuration
    # @yield [Configuration] global configuration
    def configure; end

    # @private
    def const_missing(name); end

    def context(*args, &example_group_block); end

    # The example being executed.
    #
    # The primary audience for this method is library authors who need access
    # to the example currently being executed and also want to support all
    # versions of RSpec 2 and 3.
    #
    # @example
    #
    #   RSpec.configure do |c|
    #   # context.example is deprecated, but RSpec.current_example is not
    #   # available until RSpec 3.0.
    #   fetch_current_example = RSpec.respond_to?(:current_example) ?
    #   proc { RSpec.current_example } : proc { |context| context.example }
    #
    #   c.before(:example) do
    #   example = fetch_current_example.call(self)
    #
    #   # ...
    #   end
    #   end
    def current_example; end

    # Set the current example being executed.
    #
    # @api private
    def current_example=(example); end

    # Get the current RSpec execution scope
    #
    # Returns (in order of lifecycle):
    #   * `:suite` as an initial value, this is outside of the test lifecycle.
    #   * `:before_suite_hook` during `before(:suite)` hooks.
    #   * `:before_context_hook` during `before(:context)` hooks.
    #   * `:before_example_hook` during `before(:example)` hooks and `around(:example)` before `example.run`.
    #   * `:example` within the example run.
    #   * `:after_example_hook` during `after(:example)` hooks and `around(:example)` after `example.run`.
    #   * `:after_context_hook` during `after(:context)` hooks.
    #   * `:after_suite_hook` during `after(:suite)` hooks.
    #   * `:suite` as a final value, again this is outside of the test lifecycle.
    #
    # Reminder, `:context` hooks have `:all` alias and `:example` hooks have `:each` alias.
    #
    # @return [Symbol]
    def current_scope; end

    # Set the current scope rspec is executing in
    #
    # @api private
    def current_scope=(scope); end

    def describe(*args, &example_group_block); end
    def example_group(*args, &example_group_block); end
    def fcontext(*args, &example_group_block); end
    def fdescribe(*args, &example_group_block); end

    # Used to ensure examples get reloaded and user configuration gets reset to
    # defaults between multiple runs in the same process.
    #
    # Users must invoke this if they want to have the configuration reset when
    # they use the runner multiple times within the same process. Users must deal
    # themselves with re-configuration of RSpec before run.
    def reset; end

    def shared_context(name, *args, &block); end
    def shared_examples(name, *args, &block); end
    def shared_examples_for(name, *args, &block); end

    # Internal container for global non-configuration data.
    #
    # @private
    def world; end

    # Setters for shared global objects
    #
    # @api private
    def world=(_arg0); end

    def xcontext(*args, &example_group_block); end
    def xdescribe(*args, &example_group_block); end
  end
end

# Consistent implementation for "cleaning" the caller method to strip out
# non-rspec lines. This enables errors to be reported at the call site in
# the code using the library, which is far more useful than the particular
# internal method that raised an error.
class RSpec::CallerFilter
  class << self
    # Earlier rubies do not support the two argument form of `caller`. This
    # fallback is logically the same, but slower.
    def first_non_rspec_line(skip_frames = T.unsafe(nil), increment = T.unsafe(nil)); end
  end
end

RSpec::CallerFilter::ADDITIONAL_TOP_LEVEL_FILES = T.let(T.unsafe(nil), Array)

# rubygems/core_ext/kernel_require.rb isn't actually part of rspec (obviously) but we want
# it ignored when we are looking for the first meaningful line of the backtrace outside
# of RSpec. It can show up in the backtrace as the immediate first caller
# when `CallerFilter.first_non_rspec_line` is called from the top level of a required
# file, but it depends on if rubygems is loaded or not. We don't want to have to deal
# with this complexity in our `RSpec.deprecate` calls, so we ignore it here.
RSpec::CallerFilter::IGNORE_REGEX = T.let(T.unsafe(nil), Regexp)

RSpec::CallerFilter::LIB_REGEX = T.let(T.unsafe(nil), Regexp)
RSpec::CallerFilter::RSPEC_LIBS = T.let(T.unsafe(nil), Array)

# @private
RSpec::MODULES_TO_AUTOLOAD = T.let(T.unsafe(nil), Hash)

# @private
RSpec::SharedContext = RSpec::Core::SharedContext

module RSpec::Support
  class << self
    # Used internally to get a class of a given object, even if it does not respond to #class.
    #
    # @api private
    def class_of(object); end

    # Defines a helper method that is optimized to require files from the
    # named lib. The passed block MUST be `{ |f| require_relative f }`
    # because for `require_relative` to work properly from within the named
    # lib the line of code must be IN that lib.
    #
    # `require_relative` is preferred when available because it is always O(1),
    # regardless of the number of dirs in $LOAD_PATH. `require`, on the other
    # hand, does a linear O(N) search over the dirs in the $LOAD_PATH until
    # it can resolve the file relative to one of the dirs.
    #
    # @api private
    def define_optimized_require_for_rspec(lib, &require_relative); end

    # Remove a previously registered matcher. Useful for cleaning up after
    # yourself in specs.
    #
    # @private
    def deregister_matcher_definition(&block); end

    # @api private
    def failure_notifier; end

    # @api private
    def failure_notifier=(callable); end

    # @private
    # @return [Boolean]
    def is_a_matcher?(object); end

    # @private
    def matcher_definitions; end

    def method_handle_for(object, method_name); end

    # @api private
    def notify_failure(failure, options = T.unsafe(nil)); end

    # Used internally to break cyclic dependency between mocks, expectations,
    # and support. We don't currently have a consistent implementation of our
    # matchers, though we are considering changing that:
    # https://github.com/rspec/rspec-mocks/issues/513
    #
    # @private
    def register_matcher_definition(&block); end

    def require_rspec_core(f); end
    def require_rspec_expectations(f); end
    def require_rspec_matchers(f); end
    def require_rspec_mocks(f); end
    def require_rspec_support(f); end

    # gives a string representation of an object for use in RSpec descriptions
    #
    # @api private
    def rspec_description_for_object(object); end

    # A single thread local variable so we don't excessively pollute that namespace.
    def thread_local_data; end

    # @api private
    def warning_notifier; end

    # @api private
    def warning_notifier=(_arg0); end

    # @api private
    def with_failure_notifier(callable); end
  end
end

# @private
module RSpec::Support::AllExceptionsExceptOnesWeMustNotRescue
  class << self
    def ===(exception); end
  end
end

# These exceptions are dangerous to rescue as rescuing them
# would interfere with things we should not interfere with.
RSpec::Support::AllExceptionsExceptOnesWeMustNotRescue::AVOID_RESCUING = T.let(T.unsafe(nil), Array)

# Deals with the slightly different semantics of block arguments.
# For methods, arguments are required unless a default value is provided.
# For blocks, arguments are optional, even if no default value is provided.
#
# However, we want to treat block args as required since you virtually
# always want to pass a value for each received argument and our
# `and_yield` has treated block args as required for many years.
#
# @api private
class RSpec::Support::BlockSignature < ::RSpec::Support::MethodSignature
  # @api private
  def classify_parameters; end
end

# @private
class RSpec::Support::ComparableVersion
  include ::Comparable

  # @return [ComparableVersion] a new instance of ComparableVersion
  def initialize(string); end

  def <=>(other); end
  def segments; end

  # Returns the value of attribute string.
  def string; end
end

# @private
RSpec::Support::DEFAULT_FAILURE_NOTIFIER = T.let(T.unsafe(nil), Proc)

# @private
RSpec::Support::DEFAULT_WARNING_NOTIFIER = T.let(T.unsafe(nil), Proc)

class RSpec::Support::Differ
  # @return [Differ] a new instance of Differ
  def initialize(opts = T.unsafe(nil)); end

  # @return [Boolean]
  def color?; end

  def diff(actual, expected); end
  def diff_as_object(actual, expected); end
  def diff_as_string(actual, expected); end

  private

  def add_old_hunk_to_hunk(hunk, oldhunk); end
  def add_to_output(output, string); end

  # @return [Boolean]
  def all_strings?(*args); end

  # @return [Boolean]
  def any_multiline_strings?(*args); end

  def blue(text); end
  def build_hunks(actual, expected); end
  def coerce_to_string(string_or_array); end
  def color(text, color_code); end
  def color_diff(diff); end
  def diffably_stringify(array); end
  def finalize_output(output, final_line); end
  def format_type; end
  def green(text); end
  def handle_encoding_errors(actual, expected); end
  def hash_to_string(hash); end

  # @return [Boolean]
  def multiline?(string); end

  # @return [Boolean]
  def no_numbers?(*args); end

  # @return [Boolean]
  def no_procs?(*args); end

  def normal(text); end
  def object_to_string(object); end
  def red(text); end
  def safely_flatten(array); end
end

# Replacement for fileutils#mkdir_p because we don't want to require parts
# of stdlib in RSpec.
#
# @api private
class RSpec::Support::DirectoryMaker
  class << self
    # Implements nested directory construction
    #
    # @api private
    def mkdir_p(path); end

    private

    # @api private
    # @return [Boolean]
    def directory_exists?(dirname); end

    # @api private
    def generate_path(stack, part); end

    # @api private
    def generate_stack(path); end
  end
end

# @private
class RSpec::Support::EncodedString
  # @return [EncodedString] a new instance of EncodedString
  def initialize(string, encoding = T.unsafe(nil)); end

  def <<(string); end
  def ==(*args, &block); end
  def empty?(*args, &block); end
  def encoding(*args, &block); end
  def eql?(*args, &block); end
  def lines(*args, &block); end

  # Returns the value of attribute source_encoding.
  def source_encoding; end

  def split(regex_or_string); end
  def to_s; end
  def to_str; end

  private

  def detect_source_encoding(string); end

  # Encoding Exceptions:
  #
  # Raised by Encoding and String methods:
  #   Encoding::UndefinedConversionError:
  #     when a transcoding operation fails
  #     if the String contains characters invalid for the target encoding
  #     e.g. "\x80".encode('UTF-8','ASCII-8BIT')
  #     vs "\x80".encode('UTF-8','ASCII-8BIT', undef: :replace, replace: '<undef>')
  #     # => '<undef>'
  #   Encoding::CompatibilityError
  #     when Encoding.compatibile?(str1, str2) is nil
  #     e.g. utf_16le_emoji_string.split("\n")
  #     e.g. valid_unicode_string.encode(utf8_encoding) << ascii_string
  #   Encoding::InvalidByteSequenceError:
  #     when the string being transcoded contains a byte invalid for
  #     either the source or target encoding
  #     e.g. "\x80".encode('UTF-8','US-ASCII')
  #     vs "\x80".encode('UTF-8','US-ASCII', invalid: :replace, replace: '<byte>')
  #     # => '<byte>'
  #   ArgumentError
  #     when operating on a string with invalid bytes
  #     e.g."\x80".split("\n")
  #   TypeError
  #     when a symbol is passed as an encoding
  #     Encoding.find(:"UTF-8")
  #     when calling force_encoding on an object
  #     that doesn't respond to #to_str
  #
  # Raised by transcoding methods:
  #   Encoding::ConverterNotFoundError:
  #     when a named encoding does not correspond with a known converter
  #     e.g. 'abc'.force_encoding('UTF-8').encode('foo')
  #     or a converter path cannot be found
  #     e.g. "\x80".force_encoding('ASCII-8BIT').encode('Emacs-Mule')
  #
  # Raised by byte <-> char conversions
  #   RangeError: out of char range
  #     e.g. the UTF-16LE emoji: 128169.chr
  def matching_encoding(string); end

  # http://stackoverflow.com/a/8711118/879854
  # Loop over chars in a string replacing chars
  # with invalid encoding, which is a pretty good proxy
  # for the invalid byte sequence that causes an ArgumentError
  def remove_invalid_bytes(string); end

  class << self
    def pick_encoding(source_a, source_b); end
  end
end

# Ruby's default replacement string is:
#   U+FFFD ("\xEF\xBF\xBD"), for Unicode encoding forms, else
#   ?      ("\x3F")
RSpec::Support::EncodedString::REPLACE = T.let(T.unsafe(nil), String)

RSpec::Support::EncodedString::US_ASCII = T.let(T.unsafe(nil), String)

# Reduce allocations by storing constants.
RSpec::Support::EncodedString::UTF_8 = T.let(T.unsafe(nil), String)

# Provides a means to fuzzy-match between two arbitrary objects.
# Understands array/hash nesting. Uses `===` or `==` to
# perform the matching.
module RSpec::Support::FuzzyMatcher
  class << self
    # @api private
    # @return [Boolean]
    def values_match?(expected, actual); end

    private

    # @private
    # @return [Boolean]
    def arrays_match?(expected_list, actual_list); end

    # @private
    # @return [Boolean]
    def hashes_match?(expected_hash, actual_hash); end
  end
end

# @private
class RSpec::Support::HunkGenerator
  # @return [HunkGenerator] a new instance of HunkGenerator
  def initialize(actual, expected); end

  def hunks; end

  private

  def actual_lines; end
  def build_hunk(piece); end
  def context_lines; end
  def diffs; end
  def expected_lines; end
end

# @api private
RSpec::Support::KERNEL_METHOD_METHOD = T.let(T.unsafe(nil), UnboundMethod)

# Allows matchers to be used instead of providing keyword arguments. In
# practice, when this happens only the arity of the method is verified.
#
# @private
class RSpec::Support::LooseSignatureVerifier < ::RSpec::Support::MethodSignatureVerifier
  private

  def split_args(*args); end
end

# If a matcher is used in a signature in place of keyword arguments, all
# keyword argument validation needs to be skipped since the matcher is
# opaque.
#
# Instead, keyword arguments will be validated when the method is called
# and they are actually known.
#
# @private
class RSpec::Support::LooseSignatureVerifier::SignatureWithKeywordArgumentsMatcher
  # @return [SignatureWithKeywordArgumentsMatcher] a new instance of SignatureWithKeywordArgumentsMatcher
  def initialize(signature); end

  # @return [Boolean]
  def has_kw_args_in?(args); end

  def invalid_kw_args_from(_kw_args); end
  def missing_kw_args_from(_kw_args); end
  def non_kw_args_arity_description; end

  # @return [Boolean]
  def valid_non_kw_args?(*args); end
end

# Extracts info about the number of arguments and allowed/required
# keyword args of a given method.
#
# @private
class RSpec::Support::MethodSignature
  # @return [MethodSignature] a new instance of MethodSignature
  def initialize(method); end

  # @return [Boolean]
  def arbitrary_kw_args?; end

  def classify_arity(arity = T.unsafe(nil)); end
  def classify_parameters; end

  # Without considering what the last arg is, could it
  # contain keyword arguments?
  #
  # @return [Boolean]
  def could_contain_kw_args?(args); end

  def description; end

  # If the last argument is Hash, Ruby will treat only symbol keys as keyword arguments
  # the rest will be grouped in another Hash and passed as positional argument.
  #
  # @return [Boolean]
  def has_kw_args_in?(args); end

  def invalid_kw_args_from(given_kw_args); end
  def max_non_kw_args; end
  def min_non_kw_args; end
  def missing_kw_args_from(given_kw_args); end
  def non_kw_args_arity_description; end
  def optional_kw_args; end
  def required_kw_args; end

  # @return [Boolean]
  def unlimited_args?; end

  # @return [Boolean]
  def valid_non_kw_args?(positional_arg_count, optional_max_arg_count = T.unsafe(nil)); end
end

RSpec::Support::MethodSignature::INFINITY = T.let(T.unsafe(nil), Float)

# Encapsulates expectations about the number of arguments and
# allowed/required keyword args of a given method.
#
# @api private
class RSpec::Support::MethodSignatureExpectation
  # @api private
  # @return [MethodSignatureExpectation] a new instance of MethodSignatureExpectation
  def initialize; end

  # @api private
  # @return [Boolean]
  def empty?; end

  # @api private
  def expect_arbitrary_keywords; end

  # @api private
  def expect_arbitrary_keywords=(_arg0); end

  # @api private
  def expect_unlimited_arguments; end

  # @api private
  def expect_unlimited_arguments=(_arg0); end

  # @api private
  def keywords; end

  # @api private
  def keywords=(values); end

  # @api private
  def max_count; end

  # @api private
  # @raise [ArgumentError]
  def max_count=(number); end

  # @api private
  def min_count; end

  # @api private
  # @raise [ArgumentError]
  def min_count=(number); end
end

# Abstract base class for signature verifiers.
#
# @api private
class RSpec::Support::MethodSignatureVerifier
  # @api private
  # @return [MethodSignatureVerifier] a new instance of MethodSignatureVerifier
  def initialize(signature, args = T.unsafe(nil)); end

  # @api private
  def error_message; end

  # @api private
  def kw_args; end

  # @api private
  def max_non_kw_args; end

  # @api private
  def min_non_kw_args; end

  # @api private
  def non_kw_args; end

  # @api private
  # @return [Boolean]
  def valid?; end

  # @api private
  def with_expectation(expectation); end

  private

  # @api private
  # @return [Boolean]
  def arbitrary_kw_args?; end

  # @api private
  def invalid_kw_args; end

  # @api private
  def missing_kw_args; end

  # @api private
  def split_args(*args); end

  # @api private
  # @return [Boolean]
  def unlimited_args?; end

  # @api private
  # @return [Boolean]
  def valid_non_kw_args?; end
end

# On 1.9 and up, this is in core, so we just use the real one
class RSpec::Support::Mutex < ::Thread::Mutex
  class << self
    def new; end
  end
end

# If you mock Mutex.new you break our usage of Mutex, so
# instead we capture the original method to return Mutexs.
RSpec::Support::Mutex::NEW_MUTEX_METHOD = T.let(T.unsafe(nil), Method)

# Provides query methods for different OS or OS features.
#
# @api private
module RSpec::Support::OS
  private

  # @api private
  def windows?; end

  # @api private
  def windows_file_path?; end

  class << self
    # @api private
    # @return [Boolean]
    def windows?; end

    # @api private
    # @return [Boolean]
    def windows_file_path?; end
  end
end

# Provide additional output details beyond what `inspect` provides when
# printing Time, DateTime, or BigDecimal
#
# @api private
class RSpec::Support::ObjectFormatter
  # @api private
  # @return [ObjectFormatter] a new instance of ObjectFormatter
  def initialize(max_formatted_output_length = T.unsafe(nil)); end

  # @api private
  def format(object); end

  # @api private
  def max_formatted_output_length; end

  # @api private
  def max_formatted_output_length=(_arg0); end

  # @api private
  def prepare_array(array); end

  # @api private
  def prepare_element(element); end

  # Prepares the provided object to be formatted by wrapping it as needed
  # in something that, when `inspect` is called on it, will produce the
  # desired output.
  #
  # This allows us to apply the desired formatting to hash/array data structures
  # at any level of nesting, simply by walking that structure and replacing items
  # with custom items that have `inspect` defined to return the desired output
  # for that item. Then we can just use `Array#inspect` or `Hash#inspect` to
  # format the entire thing.
  #
  # @api private
  def prepare_for_inspection(object); end

  # @api private
  def prepare_hash(input_hash); end

  # @api private
  # @return [Boolean]
  def recursive_structure?(object); end

  # @api private
  def sort_hash_keys(input_hash); end

  # @api private
  def with_entering_structure(structure); end

  private

  # Returns the substring defined by the start_index and end_index
  # If the string ends with a partial ANSI code code then that
  # will be removed as printing partial ANSI
  # codes to the terminal can lead to corruption
  #
  # @api private
  def truncate_string(str, start_index, end_index); end

  class << self
    # Methods are deferred to a default instance of the class to maintain the interface
    # For example, calling ObjectFormatter.format is still possible
    #
    # @api private
    def default_instance; end

    # @api private
    def format(object); end

    # @api private
    def prepare_for_inspection(object); end
  end
end

# @api private
class RSpec::Support::ObjectFormatter::BaseInspector < ::Struct
  # Returns the value of attribute formatter
  #
  # @return [Object] the current value of formatter
  def formatter; end

  # Sets the attribute formatter
  #
  # @param value [Object] the value to set the attribute formatter to.
  # @return [Object] the newly set value
  def formatter=(_); end

  # @api private
  # @raise [NotImplementedError]
  def inspect; end

  # Returns the value of attribute object
  #
  # @return [Object] the current value of object
  def object; end

  # Sets the attribute object
  #
  # @param value [Object] the value to set the attribute object to.
  # @return [Object] the newly set value
  def object=(_); end

  # @api private
  def pretty_print(pp); end

  class << self
    def [](*_arg0); end

    # @api private
    # @raise [NotImplementedError]
    # @return [Boolean]
    def can_inspect?(_object); end

    def inspect; end
    def keyword_init?; end
    def members; end
    def new(*_arg0); end
  end
end

# @api private
class RSpec::Support::ObjectFormatter::BigDecimalInspector < ::RSpec::Support::ObjectFormatter::BaseInspector
  # @api private
  def inspect; end

  class << self
    # @api private
    # @return [Boolean]
    def can_inspect?(object); end
  end
end

# @api private
class RSpec::Support::ObjectFormatter::DateTimeInspector < ::RSpec::Support::ObjectFormatter::BaseInspector
  # ActiveSupport sometimes overrides inspect. If `ActiveSupport` is
  # defined use a custom format string that includes more time precision.
  #
  # @api private
  def inspect; end

  class << self
    # @api private
    # @return [Boolean]
    def can_inspect?(object); end
  end
end

# @api private
RSpec::Support::ObjectFormatter::DateTimeInspector::FORMAT = T.let(T.unsafe(nil), String)

# @api private
class RSpec::Support::ObjectFormatter::DelegatorInspector < ::RSpec::Support::ObjectFormatter::BaseInspector
  # @api private
  def inspect; end

  class << self
    # @api private
    # @return [Boolean]
    def can_inspect?(object); end
  end
end

# @api private
class RSpec::Support::ObjectFormatter::DescribableMatcherInspector < ::RSpec::Support::ObjectFormatter::BaseInspector
  # @api private
  def inspect; end

  class << self
    # @api private
    # @return [Boolean]
    def can_inspect?(object); end
  end
end

# @api private
RSpec::Support::ObjectFormatter::ELLIPSIS = T.let(T.unsafe(nil), String)

# @api private
RSpec::Support::ObjectFormatter::INSPECTOR_CLASSES = T.let(T.unsafe(nil), Array)

# @api private
class RSpec::Support::ObjectFormatter::InspectableItem < ::Struct
  # @api private
  def inspect; end

  # @api private
  def pretty_print(pp); end

  # Returns the value of attribute text
  #
  # @return [Object] the current value of text
  def text; end

  # Sets the attribute text
  #
  # @param value [Object] the value to set the attribute text to.
  # @return [Object] the newly set value
  def text=(_); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def keyword_init?; end
    def members; end
    def new(*_arg0); end
  end
end

# @api private
class RSpec::Support::ObjectFormatter::InspectableObjectInspector < ::RSpec::Support::ObjectFormatter::BaseInspector
  # @api private
  def inspect; end

  class << self
    # @api private
    # @return [Boolean]
    def can_inspect?(object); end
  end
end

# @api private
class RSpec::Support::ObjectFormatter::TimeInspector < ::RSpec::Support::ObjectFormatter::BaseInspector
  # for 1.8.7
  #
  # @api private
  def inspect; end

  class << self
    # @api private
    # @return [Boolean]
    def can_inspect?(object); end
  end
end

# @api private
RSpec::Support::ObjectFormatter::TimeInspector::FORMAT = T.let(T.unsafe(nil), String)

# @api private
class RSpec::Support::ObjectFormatter::UninspectableObjectInspector < ::RSpec::Support::ObjectFormatter::BaseInspector
  # @api private
  def inspect; end

  # @api private
  def klass; end

  # http://stackoverflow.com/a/2818916
  #
  # @api private
  def native_object_id; end

  class << self
    # @api private
    # @return [Boolean]
    def can_inspect?(object); end
  end
end

# @api private
RSpec::Support::ObjectFormatter::UninspectableObjectInspector::OBJECT_ID_FORMAT = T.let(T.unsafe(nil), String)

# Provides recursive constant lookup methods useful for
# constant stubbing.
module RSpec::Support::RecursiveConstMethods
  # @return [Boolean]
  def const_defined_on?(mod, const_name); end

  def constants_defined_on(mod); end

  # @raise [NameError]
  def get_const_defined_on(mod, const_name); end

  def normalize_const_name(const_name); end

  # @return [Boolean]
  def recursive_const_defined?(const_name); end

  def recursive_const_get(const_name); end
end

# Allows a thread to lock out other threads from a critical section of code,
# while allowing the thread with the lock to reenter that section.
#
# Based on Monitor as of 2.2 -
# https://github.com/ruby/ruby/blob/eb7ddaa3a47bf48045d26c72eb0f263a53524ebc/lib/monitor.rb#L9
#
# Depends on Mutex, but Mutex is only available as part of core since 1.9.1:
#   exists - http://ruby-doc.org/core-1.9.1/Mutex.html
#   dne    - http://ruby-doc.org/core-1.9.0/Mutex.html
#
# @private
class RSpec::Support::ReentrantMutex
  # @return [ReentrantMutex] a new instance of ReentrantMutex
  def initialize; end

  def synchronize; end

  private

  def enter; end
  def exit; end
end

# Provides query methods for different rubies
#
# @api private
module RSpec::Support::Ruby
  private

  # @api private
  def jruby?; end

  # @api private
  def jruby_9000?; end

  # @api private
  def jruby_version; end

  # @api private
  def mri?; end

  # @api private
  def non_mri?; end

  # @api private
  def rbx?; end

  # @api private
  def truffleruby?; end

  class << self
    # @api private
    # @return [Boolean]
    def jruby?; end

    # @api private
    # @return [Boolean]
    def jruby_9000?; end

    # @api private
    def jruby_version; end

    # @api private
    # @return [Boolean]
    def mri?; end

    # @api private
    # @return [Boolean]
    def non_mri?; end

    # @api private
    # @return [Boolean]
    def rbx?; end

    # @api private
    # @return [Boolean]
    def truffleruby?; end
  end
end

# Provides query methods for ruby features that differ among
# implementations.
#
# @api private
module RSpec::Support::RubyFeatures
  private

  # @api private
  def caller_locations_supported?; end

  # On JRuby 1.7 `--1.8` mode, `Process.respond_to?(:fork)` returns true,
  # but when you try to fork, it raises an error:
  #   NotImplementedError: fork is not available on this platform
  #
  # When we drop support for JRuby 1.7 and/or Ruby 1.8, we can drop
  # this special case.
  #
  # @api private
  # @return [Boolean]
  def fork_supported?; end

  # @api private
  # @return [Boolean]
  def kw_args_supported?; end

  # @api private
  def module_prepends_supported?; end

  # @api private
  def module_refinement_supported?; end

  # @api private
  def optional_and_splat_args_supported?; end

  # @api private
  # @return [Boolean]
  def required_kw_args_supported?; end

  # @api private
  # @return [Boolean]
  def ripper_supported?; end

  # @api private
  # @return [Boolean]
  def supports_exception_cause?; end

  # @api private
  # @return [Boolean]
  def supports_rebinding_module_methods?; end

  # @api private
  # @return [Boolean]
  def supports_taint?; end

  class << self
    # @api private
    # @return [Boolean]
    def caller_locations_supported?; end

    def fork_supported?; end
    def kw_args_supported?; end

    # @api private
    # @return [Boolean]
    def module_prepends_supported?; end

    # @api private
    # @return [Boolean]
    def module_refinement_supported?; end

    # @api private
    # @return [Boolean]
    def optional_and_splat_args_supported?; end

    def required_kw_args_supported?; end
    def ripper_supported?; end
    def supports_exception_cause?; end
    def supports_rebinding_module_methods?; end
    def supports_taint?; end
  end
end

# Figures out wether a given method can accept various arguments.
# Surprisingly non-trivial.
#
# @private
RSpec::Support::StrictSignatureVerifier = RSpec::Support::MethodSignatureVerifier

module RSpec::Support::Version; end
RSpec::Support::Version::STRING = T.let(T.unsafe(nil), String)

module RSpec::Support::Warnings
  def deprecate(deprecated, options = T.unsafe(nil)); end

  # Used internally to print deprecation warnings
  # when rspec-core isn't loaded
  #
  # @private
  def warn_deprecation(message, options = T.unsafe(nil)); end

  # Used internally to print longer warnings
  #
  # @private
  def warn_with(message, options = T.unsafe(nil)); end

  # Used internally to print warnings
  #
  # @private
  def warning(text, options = T.unsafe(nil)); end
end

module RSpec::Support::WithKeywordsWhenNeeded
  private

  # Remove this in RSpec 4 in favour of explictly passed in kwargs where
  # this is used. Works around a warning in Ruby 2.7
  def class_exec(klass, *args, **_arg2, &block); end

  class << self
    def class_exec(klass, *args, **_arg2, &block); end
  end
end
