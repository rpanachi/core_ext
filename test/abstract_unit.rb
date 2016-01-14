ORIG_ARGV = ARGV.dup

begin
  old, $VERBOSE = $VERBOSE, nil
  # require File.expand_path('../../../load_paths', __FILE__)
ensure
  $VERBOSE = old
end

require 'core_ext/kernel/reporting'

silence_warnings do
  Encoding.default_internal = "UTF-8"
  Encoding.default_external = "UTF-8"
end

require 'core_ext/testing/autorun'
require 'core_ext/testing/method_call_assertions'

ENV['NO_RELOAD'] = '1'
require 'core_ext'
require 'core_ext/test_case'

Thread.abort_on_exception = true

# Show backtraces for deprecated behavior for quicker cleanup.
CoreExt::Deprecation.debug = true

# Disable available locale checks to avoid warnings running the test suite.
I18n.enforce_available_locales = false

# Skips the current run on Rubinius using Minitest::Assertions#skip
def rubinius_skip(message = '')
  skip message if RUBY_ENGINE == 'rbx'
end

# Skips the current run on JRuby using Minitest::Assertions#skip
def jruby_skip(message = '')
  skip message if defined?(JRUBY_VERSION)
end

class CoreExt::TestCase
  include CoreExt::Testing::MethodCallAssertions
end
