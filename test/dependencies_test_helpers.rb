module DependenciesTestHelpers
  def with_loading(*from)
    old_mechanism, CoreExt::Dependencies.mechanism = CoreExt::Dependencies.mechanism, :load
    this_dir = File.dirname(__FILE__)
    parent_dir = File.dirname(this_dir)
    path_copy = $LOAD_PATH.dup
    $LOAD_PATH.unshift(parent_dir) unless $LOAD_PATH.include?(parent_dir)
    prior_autoload_paths = CoreExt::Dependencies.autoload_paths
    CoreExt::Dependencies.autoload_paths = from.collect { |f| "#{this_dir}/#{f}" }
    yield
  ensure
    $LOAD_PATH.replace(path_copy)
    CoreExt::Dependencies.autoload_paths = prior_autoload_paths
    CoreExt::Dependencies.mechanism = old_mechanism
    CoreExt::Dependencies.explicitly_unloadable_constants = []
    CoreExt::Dependencies.clear
  end

  def with_autoloading_fixtures(&block)
    with_loading 'autoloading_fixtures', &block
  end

  def remove_constants(*constants)
    constants.each do |constant|
      Object.send(:remove_const, constant) if Object.const_defined?(constant)
    end
  end
end
