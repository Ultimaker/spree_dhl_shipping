module Spree
  class DhlShippingMethod < ActiveRecord::Base
    has_many :shipping_zones, class_name: 'Spree::DhlShippingZone', foreign_key: 'dhl_shipping_method_id'
    has_many :surcharges, class_name: 'Spree::DhlSurcharge', foreign_key: 'dhl_shipping_method_id'

    alias_method :dhl_shipping_zones, :shipping_zones
    alias_method :dhl_surcharges, :surcharges

    attr_accessible :method_class, :name, :volume_factor, :volume_size_threshold

    default_scope order('name ASC')

    validates :method_class, :name, :volume_factor, :volume_size_threshold, presence: true
    validates :volume_factor, :volume_size_threshold, numericality: true
    validates :method_class, uniqueness: true

    def shipment_allowed_to?(address)
      if address && address.country_id && address.zipcode
        zones = Spree::DhlCountryZone.unscoped.includes(:shipping_zone).where(country_id: address.country_id, spree_dhl_shipping_zones: { dhl_shipping_method_id: self.id }).keep_if { |zone| zone.zip_code_allowed?(address.zipcode) }
      end

      return false if !zones || zones.none?

      true
    end

    def zones_for_address(address)
      Spree::DhlCountryZone.unscoped.includes(:shipping_zone).order('spree_dhl_shipping_zones.opening_tariff ASC, spree_dhl_shipping_zones.per_weigh_unit ASC').where(country_id: address.country_id, spree_dhl_shipping_zones: { dhl_shipping_method_id: self.id }).keep_if { |zone| zone.zip_code_allowed?(address.zipcode) }.map(&:shipping_zone).flatten
    end

    def surcharges_total
      1 + surcharges.map(&:value).inject(:+)
    end
  end
end
