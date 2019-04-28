module SafChallenge
  module Taxes
    class Base
      attr_accessor :product

      def price
        round_to_5_cents(product.price * tax)
      end

      private

      def round_to_5_cents(total)
        whole, remainder = total.divmod(0.05)
        num_steps = remainder > 0 ? whole + 1 : whole
        num_steps * 0.05
      end
    end
  end
end
