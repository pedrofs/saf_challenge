module SafChallenge
  class Product
    attr_reader :cost, :quantity, :description, :taxes

    def initialize(options = {})
      @cost = options[:cost]
      @quantity = options[:quantity]
      @description = options[:description]
      @taxes = []

      options[:taxes].each { |tax| tax.product = self; @taxes << tax }
    end

    def total_price
      (price + taxes_price).round(2)
    end

    def price
      cost * quantity
    end

    def taxes_price
      taxes.collect(&:price).inject(&:+)
    end
  end
end
