module SafChallenge
  module Taxes
    class ImportedTax < Taxes::Base
      def tax
        0.05
      end
    end
  end
end
