require 'singleton'

module CoreExt
  # \Deprecation specifies the API used by Rails to deprecate methods, instance
  # variables, objects and constants.
  class Deprecation
    # core_ext.rb sets an autoload for CoreExt::Deprecation.
    #
    # If these requires were at the top of the file the constant would not be
    # defined by the time their files were loaded. Since some of them reopen
    # CoreExt::Deprecation its autoload would be triggered, resulting in
    # a circular require warning for core_ext/deprecation.rb.
    #
    # So, we define the constant first, and load dependencies later.
    require 'core_ext/deprecation/instance_delegator'
    require 'core_ext/deprecation/behaviors'
    require 'core_ext/deprecation/reporting'
    require 'core_ext/deprecation/method_wrappers'
    require 'core_ext/deprecation/proxy_wrappers'
    require 'core_ext/module/deprecation'

    include Singleton
    include InstanceDelegator
    include Behavior
    include Reporting
    include MethodWrapper

    # The version number in which the deprecated behavior will be removed, by default.
    attr_accessor :deprecation_horizon

    # It accepts two parameters on initialization. The first is a version of library
    # and the second is a library name
    #
    #   CoreExt::Deprecation.new('2.0', 'MyLibrary')
    def initialize(deprecation_horizon = '5.0', gem_name = 'Rails')
      self.gem_name = gem_name
      self.deprecation_horizon = deprecation_horizon
      # By default, warnings are not silenced and debugging is off.
      self.silenced = false
      self.debug = false
    end
  end
end
