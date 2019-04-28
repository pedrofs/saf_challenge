module SafChallenge
  class Cart
    attr_accessor :products

    def total_price
      sum(products.collect(&:total_price))
    end

    def total_taxes
      sum(products.collect(&:taxes_price))
    end

    private

    def sum(prices)
      prices.inject(&:+).round(2)
    end
  end
end
