require 'abstract_unit'
require 'core_ext/load_error'

class TestMissingSourceFile < CoreExt::TestCase
  def test_it_is_deprecated
    assert_deprecated do
      MissingSourceFile.new
    end
  end
end

class TestLoadError < CoreExt::TestCase
  def test_with_require
    assert_raise(LoadError) { require 'no_this_file_don\'t_exist' }
  end
  def test_with_load
    assert_raise(LoadError) { load 'nor_does_this_one' }
  end
  def test_path
    begin load 'nor/this/one.rb'
    rescue LoadError => e
      assert_equal 'nor/this/one.rb', e.path
    end
  end
end
