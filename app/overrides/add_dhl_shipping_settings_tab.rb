Deface::Override.new(
  virtual_path: "spree/admin/shared/_configuration_menu",
  name: "add_dhl_shipping_settings_tab",
  insert_bottom: "[data-hook='admin_configurations_sidebar_menu'], #admin_configurations_sidebar_menu[data-hook]",
  text: "<li<%= ' class=active' if controller.controller_name =~ /^dhl_/ %>><%= link_to \"DHL Shipping\", admin_dhl_shipping_methods_path %></li>"
)
