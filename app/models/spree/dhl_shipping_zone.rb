module Spree
  class DhlShippingZone < ActiveRecord::Base
    belongs_to :shipping_method, class_name: 'Spree::DhlShippingMethod', foreign_key: 'dhl_shipping_method_id'
    has_many :country_zones, class_name: 'Spree::DhlCountryZone', foreign_key: 'shipping_zone_id'

    alias_method :dhl_country_zones, :country_zones
    alias_method :dhl_shipping_method, :shipping_method

    # attr_accessible :shipping_method, :dhl_shipping_method_id, :name, :per_weigh_unit, :opening_tariff

    default_scope { order('spree_dhl_shipping_zones.name ASC') }

    validates :shipping_method, :name, :per_weigh_unit, :opening_tariff, presence: true
    validates :per_weigh_unit, :opening_tariff, numericality: true
  end
end
