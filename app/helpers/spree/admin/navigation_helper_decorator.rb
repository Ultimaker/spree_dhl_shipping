module Spree
  module Admin
    NavigationHelper.module_eval do
      def button_link_to_with_icon(icon_name, text, url, options = {})
        options[:class] = options[:class].to_s + " btn btn-primary btn-sm"
        link_to_with_icon(icon_name, text, url, options)
      end
    end
  end
end