require "saf_challenge/version"
require "saf_challenge/cli/from_file"
require "saf_challenge/cli/output"
require "saf_challenge/parser/content"
require "saf_challenge/parser/line"
require "saf_challenge/build_cart"
require "saf_challenge/build_taxes"
require "saf_challenge/product_price"
require "saf_challenge/tax_price"
require "saf_challenge/exempt_product_service"
require "saf_challenge/cart"
require "saf_challenge/product"
require "saf_challenge/taxes/base"
require "saf_challenge/taxes/basic_sale_tax"
require "saf_challenge/taxes/imported_tax"
require "saf_challenge/cart_price"
require "saf_challenge/cart_taxes_price"
require "saf_challenge/cart_total_price"

module SafChallenge
  class << self
    def configuration
      @@configuration ||= Configuration.new
    end
  end

  def self.configure
    yield(configuration)
  end

  class Configuration
    attr_accessor :exempt_product_service, :input_content_strategy

    def initialize
      @exempt_product_service = SafChallenge::ExemptProductService.new
      @input_content_strategy = CLI::FromFile
    end
  end

  class App
    def run!
      CLI::Output.call(cart)
    end

    def cart
      @cart ||= BuildCart.call(input_content)
    end

    private

    def input_content
      SafChallenge.configuration.input_content_strategy.call(ARGV)
    end
  end
end
