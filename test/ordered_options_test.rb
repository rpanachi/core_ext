require 'abstract_unit'
require 'core_ext/ordered_options'

class OrderedOptionsTest < CoreExt::TestCase
  def test_usage
    a = CoreExt::OrderedOptions.new

    assert_nil a[:not_set]

    a[:allow_concurrency] = true
    assert_equal 1, a.size
    assert a[:allow_concurrency]

    a[:allow_concurrency] = false
    assert_equal 1, a.size
    assert !a[:allow_concurrency]

    a["else_where"] = 56
    assert_equal 2, a.size
    assert_equal 56, a[:else_where]
  end

  def test_looping
    a = CoreExt::OrderedOptions.new

    a[:allow_concurrency] = true
    a["else_where"] = 56

    test = [[:allow_concurrency, true], [:else_where, 56]]

    a.each_with_index do |(key, value), index|
      assert_equal test[index].first, key
      assert_equal test[index].last, value
    end
  end

  def test_method_access
    a = CoreExt::OrderedOptions.new

    assert_nil a.not_set

    a.allow_concurrency = true
    assert_equal 1, a.size
    assert a.allow_concurrency

    a.allow_concurrency = false
    assert_equal 1, a.size
    assert !a.allow_concurrency

    a.else_where = 56
    assert_equal 2, a.size
    assert_equal 56, a.else_where
  end

  def test_inheritable_options_continues_lookup_in_parent
    parent = CoreExt::OrderedOptions.new
    parent[:foo] = true

    child = CoreExt::InheritableOptions.new(parent)
    assert child.foo
  end

  def test_inheritable_options_can_override_parent
    parent = CoreExt::OrderedOptions.new
    parent[:foo] = :bar

    child = CoreExt::InheritableOptions.new(parent)
    child[:foo] = :baz

    assert_equal :baz, child.foo
  end

  def test_inheritable_options_inheritable_copy
    original = CoreExt::InheritableOptions.new
    copy     = original.inheritable_copy

    assert copy.kind_of?(original.class)
    assert_not_equal copy.object_id, original.object_id
  end

  def test_introspection
    a = CoreExt::OrderedOptions.new
    assert a.respond_to?(:blah)
    assert a.respond_to?(:blah=)
    assert_equal 42, a.method(:blah=).call(42)
    assert_equal 42, a.method(:blah).call
  end

  def test_raises_with_bang
    a = CoreExt::OrderedOptions.new
    a[:foo] = :bar
    assert a.respond_to?(:foo!)

    assert_nothing_raised { a.foo! }
    assert_equal a.foo, a.foo!

    assert_raises(KeyError) do
      a.foo = nil
      a.foo!
    end
    assert_raises(KeyError) { a.non_existing_key! }
  end
end
