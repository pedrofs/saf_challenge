module SafChallenge
  module Taxes
    class BasicSaleTax < Taxes::Base
      def tax
        0.1
      end
    end
  end
end
