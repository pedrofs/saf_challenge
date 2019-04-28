module SafChallenge
  class TaxPrice
    def self.call(tax)
      new(tax).call
    end

    def initialize(tax)
      @tax = tax
    end

    def call
      (unit_cost_tax * product_quantity).round(2)
    end

    private

    attr_reader :tax

    def unit_cost_tax
      round_to_5_cents(product_unit_cost * tax.fee)
    end

    def product_unit_cost
      tax.product.unit_cost
    end

    def product_quantity
      tax.product.quantity
    end

    def round_to_5_cents(total)
      whole, remainder = total.divmod(0.05)
      num_steps = remainder > 0 ? whole + 1 : whole
      num_steps * 0.05
    end
  end
end
