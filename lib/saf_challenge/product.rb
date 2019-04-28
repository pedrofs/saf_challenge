module SafChallenge
  class Product
    attr_reader :unit_cost, :quantity, :description, :taxes

    def initialize(options = {})
      @unit_cost = options[:unit_cost]
      @quantity = options[:quantity]
      @description = options[:description]
      @taxes = options[:taxes]

      @taxes.each { |tax| tax.product = self }
    end

    def cost
      unit_cost * quantity
    end
  end
end
