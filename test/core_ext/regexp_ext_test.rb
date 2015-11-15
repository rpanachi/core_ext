require 'abstract_unit'
require 'core_ext/regexp'

class RegexpExtAccessTests < CoreExt::TestCase
  def test_multiline
    assert_equal true, //m.multiline?
    assert_equal false, //.multiline?
    assert_equal false, /(?m:)/.multiline?
  end
end
