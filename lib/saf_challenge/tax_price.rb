module SafChallenge
  class TaxPrice
    def self.call(tax)
      new(tax).call
    end

    def initialize(tax)
      @tax = tax
    end

    def call
      round_to_5_cents(product_cost * tax.fee).round(2)
    end

    private

    attr_reader :tax

    def product_cost
      tax.product.cost
    end

    def round_to_5_cents(total)
      whole, remainder = total.divmod(0.05)
      num_steps = remainder > 0 ? whole + 1 : whole
      num_steps * 0.05
    end
  end
end
