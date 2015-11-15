require 'bigdecimal'
require 'bigdecimal/util'

module CoreExt
  module BigDecimalWithDefaultFormat #:nodoc:
    DEFAULT_STRING_FORMAT = 'F'

    def to_s(format = nil)
      super(format || DEFAULT_STRING_FORMAT)
    end
  end
end

BigDecimal.prepend(CoreExt::BigDecimalWithDefaultFormat)
