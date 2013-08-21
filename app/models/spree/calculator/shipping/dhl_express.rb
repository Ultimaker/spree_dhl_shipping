module Spree
  module Calculator::Shipping
    class DhlExpress < DhlShipping
      def self.description
        Spree.t(:description_express)
      end
    end
  end
end
