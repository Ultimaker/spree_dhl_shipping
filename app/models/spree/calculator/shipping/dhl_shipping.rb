require_dependency 'spree/shipping_calculator'

module Spree
  module Calculator::Shipping
    class DhlShipping < ShippingCalculator
      def dhl_shipping_method
        Spree::DhlShippingMethod.where(method_class: self.class.name).first
      end

      def dhl_shipping_zone(address)
        dhl_shipping_method.zones_for_address(address).first
      end

      def available?(package)
        dhl_shipping_method.shipment_allowed_to?(package.order.shipping_address)
      end

      def compute_package(package)
        address = package.order.shipping_address
        zone = dhl_shipping_zone(address)
        volume = total_volume(package.contents)
        weight = total_weight(package.contents)

        wm_sub_1 = volume * dhl_shipping_method.volume_factor
        wm_sub_2 = wm_sub_1 > weight ? wm_sub_1 : weight

        if wm_sub_2 < dhl_shipping_method.volume_size_threshold
          wm = wm_sub_2
        else
          wm = ((wm_sub_2 / 5).to_i + 1) * 5
        end

        surcharges = dhl_shipping_method.surcharges_total

        ((zone.per_weigh_unit * wm) + zone.opening_tariff) * surcharges
      end

      def total_volume(content_items)
        volume = 0
        content_items.each do |item|
          volume += item.quantity * ((item.variant.height || 1) * (item.variant.width || 1) * (item.variant.depth || 1))
        end
        volume
      end

      def total_weight(content_items)
        weight = 0
        content_items.each do |item|
          weight += item.quantity * (item.variant.weight || 1)
        end
        weight
      end
    end
  end
end
