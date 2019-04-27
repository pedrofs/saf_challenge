module SafChallenge
  class ExemptProductService
    def call(product_description)
      product_description.match(/book|pills|chocolate/)
    end
  end
end
