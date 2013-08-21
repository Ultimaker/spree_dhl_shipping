require_dependency 'spree/shipping_calculator'

module Spree
  module Calculator::Shipping
    class DhlEuroplus < DhlShipping
      def self.description
        Spree.t(:description_europlus)
      end
    end
  end
end
