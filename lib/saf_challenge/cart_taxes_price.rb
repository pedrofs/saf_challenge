module SafChallenge
  class CartTaxesPrice < CartPrice
    def call
      (taxes_prices.inject(:+) || 0).round(2)
    end

    private

    def taxes_prices
      taxes.collect { |tax| TaxPrice.call(tax) }
    end

    def taxes
      cart.products.collect(&:taxes).flatten
    end
  end
end
