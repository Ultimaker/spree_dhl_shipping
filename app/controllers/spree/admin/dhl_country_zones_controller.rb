module Spree
  module Admin
    class DhlCountryZonesController < Spree::Admin::ResourceController
      belongs_to 'spree/dhl_shipping_zone'
      before_filter :load_data, only: [:new, :create, :edit, :update]

      private

      def location_after_save
        admin_dhl_shipping_zone_path(@dhl_country_zone.shipping_zone)
      end

      def load_data
        @countries = Country.order(:name)
      end

      def collection_url
        admin_dhl_shipping_zone_path(@dhl_shipping_zone || @dhl_country_zone.shipping_zone)
      end

      def find_resource
        if parent && parent.respond_to?(controller_name)
          parent.send(controller_name).find(params[:id])
        else
          model_class.find(params[:id])
        end
      end
    end
  end
end
