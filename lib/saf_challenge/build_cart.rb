module SafChallenge
  class BuildCart
    def self.call(content)
      new(content).call
    end

    def initialize(content)
      @content = content
    end

    def call
      cart.products = parse_content.collect { |parsed_line| build_product(parsed_line) }

      cart
    end

    private

    attr_accessor :content

    def parse_content
      @content_parser ||= Parser::Content.new(content)
    end

    def build_product(parsed_line)
      Product.new(quantity: parsed_line.quantity,
                  description: parsed_line.description,
                  cost: parsed_line.cost,
                  taxes: build_taxes(parsed_line))
    end

    def build_taxes(parsed_line)
      BuildTaxes.new(SafChallenge.configuration.exempt_product_service).call(parsed_line)
    end

    def cart
      @cart ||= Cart.new
    end
  end
end
