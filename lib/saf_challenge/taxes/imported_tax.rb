module SafChallenge
  module Taxes
    class ImportedTax < Taxes::Base
      def fee
        0.05
      end
    end
  end
end
