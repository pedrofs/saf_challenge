module SafChallenge
  class CartTotalPrice < CartPrice
    def call
      products_prices.inject(:+).round(2)
    end

    private

    def products_prices
      cart.products.collect { |product| ProductPrice.call(product) }
    end
  end
end
