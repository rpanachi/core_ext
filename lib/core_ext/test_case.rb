gem 'minitest' # make sure we get the gem, not stdlib

require 'minitest'
require 'core_ext/testing/tagged_logging'
require 'core_ext/testing/setup_and_teardown'
require 'core_ext/testing/assertions'
require 'core_ext/testing/deprecation'
require 'core_ext/testing/declarative'
require 'core_ext/testing/isolation'
require 'core_ext/testing/constant_lookup'
require 'core_ext/testing/time_helpers'
require 'core_ext/testing/file_fixtures'
require 'core_ext/testing/composite_filter'
require 'core_ext/kernel/reporting'

module CoreExt
  class TestCase < ::Minitest::Test
    Assertion = Minitest::Assertion

    class << self
      # Sets the order in which test cases are run.
      #
      #   CoreExt::TestCase.test_order = :random # => :random
      #
      # Valid values are:
      # * +:random+   (to run tests in random order)
      # * +:parallel+ (to run tests in parallel)
      # * +:sorted+   (to run tests alphabetically by method name)
      # * +:alpha+    (equivalent to +:sorted+)
      def test_order=(new_order)
        CoreExt.test_order = new_order
      end

      # Returns the order in which test cases are run.
      #
      #   CoreExt::TestCase.test_order # => :random
      #
      # Possible values are +:random+, +:parallel+, +:alpha+, +:sorted+.
      # Defaults to +:random+.
      def test_order
        CoreExt.test_order ||= :random
      end

      def run(reporter, options = {})
        if options[:patterns] && options[:patterns].any? { |p| p =~ /:\d+/ }
          options[:filter] = \
            Testing::CompositeFilter.new(self, options[:filter], options[:patterns])
        end

        super
      end
    end

    alias_method :method_name, :name

    include CoreExt::Testing::TaggedLogging
    include CoreExt::Testing::SetupAndTeardown
    include CoreExt::Testing::Assertions
    include CoreExt::Testing::Deprecation
    include CoreExt::Testing::TimeHelpers
    include CoreExt::Testing::FileFixtures
    extend  CoreExt::Testing::Declarative

    # test/unit backwards compatibility methods
    alias :assert_raise :assert_raises
    alias :assert_not_empty :refute_empty
    alias :assert_not_equal :refute_equal
    alias :assert_not_in_delta :refute_in_delta
    alias :assert_not_in_epsilon :refute_in_epsilon
    alias :assert_not_includes :refute_includes
    alias :assert_not_instance_of :refute_instance_of
    alias :assert_not_kind_of :refute_kind_of
    alias :assert_no_match :refute_match
    alias :assert_not_nil :refute_nil
    alias :assert_not_operator :refute_operator
    alias :assert_not_predicate :refute_predicate
    alias :assert_not_respond_to :refute_respond_to
    alias :assert_not_same :refute_same

    # Reveals the intention that the block should not raise any exception.
    #
    #   assert_nothing_raised do
    #     ...
    #   end
    def assert_nothing_raised(*args)
      yield
    end
  end
end
