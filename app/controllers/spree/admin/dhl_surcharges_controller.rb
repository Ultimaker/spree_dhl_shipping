module Spree
  module Admin
    class DhlSurchargesController < Spree::Admin::ResourceController
      belongs_to 'spree/dhl_shipping_method'
      before_filter :load_data, only: [:new, :create, :edit, :update]

      private

      def load_data
        @dhl_shipping_methods = Spree::DhlShippingMethod.all
      end

      def collection_url
        if @dhl_surcharge.shipping_method.present?
          admin_dhl_shipping_method_dhl_surcharges_path(@dhl_surcharge.shipping_method)
        else
          super
        end
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
