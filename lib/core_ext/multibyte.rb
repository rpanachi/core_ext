module CoreExt #:nodoc:
  module Multibyte
    require 'core_ext/multibyte/chars'
    require 'core_ext/multibyte/unicode'

    # The proxy class returned when calling mb_chars. You can use this accessor
    # to configure your own proxy class so you can support other encodings. See
    # the CoreExt::Multibyte::Chars implementation for an example how to
    # do this.
    #
    #   CoreExt::Multibyte.proxy_class = CharsForUTF32
    def self.proxy_class=(klass)
      @proxy_class = klass
    end

    # Returns the current proxy class.
    def self.proxy_class
      @proxy_class ||= CoreExt::Multibyte::Chars
    end
  end
end
