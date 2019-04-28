module SafChallenge
  module Taxes
    class BasicSaleTax < Taxes::Base
      def fee
        0.1
      end
    end
  end
end
