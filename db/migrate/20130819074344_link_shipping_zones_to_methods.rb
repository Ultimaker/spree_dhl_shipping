class LinkShippingZonesToMethods < ActiveRecord::Migration
  def up
    add_column :spree_dhl_shipping_zones, :dhl_shipping_method_id, :integer
    remove_column :spree_dhl_shipping_zones, :method
  end

  def down
    add_column :spree_dhl_shipping_zones, :method, :string
    remove_column :spree_dhl_shipping_zones, :dhl_shipping_method_id
  end
end
