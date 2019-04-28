module SafChallenge
  class CartPrice
    def self.call(cart)
      new(cart).call
    end

    def initialize(cart)
      @cart = cart
    end

    protected

    attr_reader :cart
  end
end
