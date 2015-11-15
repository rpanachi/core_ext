require 'abstract_unit'
require 'core_ext/big_decimal'

class BigDecimalTest < CoreExt::TestCase
  def test_to_s
    bd = BigDecimal.new '0.01'
    assert_equal '0.01', bd.to_s
  end
end
