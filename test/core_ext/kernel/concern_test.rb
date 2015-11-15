require 'abstract_unit'
require 'core_ext/kernel/concern'

class KernelConcernTest < CoreExt::TestCase
  def test_may_be_defined_at_toplevel
    mod = ::TOPLEVEL_BINDING.eval 'concern(:ToplevelConcern) { }'
    assert_equal mod, ::ToplevelConcern
    assert_kind_of CoreExt::Concern, ::ToplevelConcern
    assert_not Object.ancestors.include?(::ToplevelConcern), mod.ancestors.inspect
  ensure
    Object.send :remove_const, :ToplevelConcern
  end
end
