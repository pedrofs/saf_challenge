module SafChallenge
  class ProductPrice
    def self.call(product)
      new(product).call
    end

    def initialize(product)
      @product = product
    end

    def call
      (product_cost + taxes_total).round(2)
    end

    private

    attr_reader :product

    def product_cost
      product.cost
    end

    def taxes_total
      taxes_prices.inject(:+) || 0
    end

    def taxes_prices
      product.taxes.collect { |tax| TaxPrice.call(tax) }
    end
  end
end
