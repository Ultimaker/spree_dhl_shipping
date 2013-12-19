module Spree
  class DhlSurcharge < ActiveRecord::Base
    belongs_to :shipping_method, class_name: 'Spree::DhlShippingMethod', foreign_key: 'dhl_shipping_method_id'

    # attr_accessible :name, :is_absolute, :shipping_method, :dhl_shipping_method_id, :value

    default_scope order('name ASC')

    validates :shipping_method, :name, :value, presence: true
    validates :value, numericality: true
  end
end
