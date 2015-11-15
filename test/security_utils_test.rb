require 'abstract_unit'
require 'core_ext/security_utils'

class SecurityUtilsTest < CoreExt::TestCase
  def test_secure_compare_should_perform_string_comparison
    assert CoreExt::SecurityUtils.secure_compare('a', 'a')
    assert !CoreExt::SecurityUtils.secure_compare('a', 'b')
  end
end
