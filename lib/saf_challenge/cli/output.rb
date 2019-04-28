module SafChallenge
  module CLI
    class Output
      def self.call(cart)
        new(cart).call
      end

      def initialize(cart)
        @cart = cart
      end

      def call
        output = ''

        cart.products.each do |product|
          output << "#{product.quantity} #{product.description}: #{sprintf('%.2f', product_price(product))}\n"
        end

        output << "Sales Taxes: #{sprintf('%.2f', sales_taxes)}\n"
        output << "Total: #{sprintf('%.2f', total)}\n"

        output
      end

      protected

      attr_reader :cart

      def sales_taxes
        SafChallenge::CartTaxesPrice.call(cart)
      end

      def total
        SafChallenge::CartTotalPrice.call(cart)
      end

      def product_price(product)
        SafChallenge::ProductPrice.call(product)
      end
    end
  end
end
