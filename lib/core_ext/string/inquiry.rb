require 'core_ext/string_inquirer'

class String
  # Wraps the current string in the <tt>CoreExt::StringInquirer</tt> class,
  # which gives you a prettier way to test for equality.
  #
  #   env = 'production'.inquiry
  #   env.production?  # => true
  #   env.development? # => false
  def inquiry
    CoreExt::StringInquirer.new(self)
  end
end
