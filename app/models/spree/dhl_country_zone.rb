module Spree
  class DhlCountryZone < ActiveRecord::Base
    belongs_to :country, class_name: 'Spree::Country'
    belongs_to :shipping_zone, class_name: 'Spree::DhlShippingZone'

    alias_method :dhl_shipping_zone, :shipping_zone

    # attr_accessible :country, :country_id, :zip_codes

    default_scope { joins(:country).order('spree_countries.name ASC') }

    validates :country, :shipping_zone, presence: true
    validates :country_id, uniqueness: { scope: :shipping_zone_id }

    def zip_codes_array
      zip_codes.split(',').map(&:strip)
    end

    def zip_code_allowed?(address_zip_code)
      return true if address_zip_code.blank? || zip_codes.blank?

      allowed = false

      zip_codes_array.each do |zip_code|
        if zip_code.match /-/
          first_part, last_part = zip_code.split('-')
          allowed_zip_codes = (first_part.gsub(/\D/, '')..last_part.gsub(/\D/, '')).to_a
        else
          allowed_zip_codes = [zip_code.gsub(/\D/, '')]
        end

        if allowed_zip_codes.any?
          chunked_address_zip_code = address_zip_code[0, allowed_zip_codes.first.length]
        else
          chunked_address_zip_code = nil
        end

        allowed = true if allowed_zip_codes.include? chunked_address_zip_code
      end

      allowed
    end
  end
end
