module SafChallenge
  class BuildTaxes
    def initialize(exempt_product_service = nil)
      @exempt_product_service = exempt_product_service
    end

    def call(parsed_line)
      taxes = []

      taxes << Taxes::BasicSaleTax.new unless exempt_product_service.call(parsed_line.description)
      taxes << Taxes::ImportedTax.new if parsed_line.imported

      taxes
    end

    private

    def exempt_product_service
      @exempt_product_service ||= ExemptProductService.new
    end
  end
end
