class MovePricesFromMethodsToZones < ActiveRecord::Migration
  def up
    add_column :spree_dhl_shipping_zones, :per_weigh_unit, :decimal, scale: 4, precision: 8
    add_column :spree_dhl_shipping_zones, :opening_tariff, :decimal, scale: 4, precision: 8
    remove_column :spree_dhl_shipping_methods, :per_weigh_unit
    remove_column :spree_dhl_shipping_methods, :opening_tariff
  end

  def down
    remove_column :spree_dhl_shipping_zones, :per_weigh_unit
    remove_column :spree_dhl_shipping_zones, :opening_tariff
    add_column :spree_dhl_shipping_methods, :per_weigh_unit, :decimal, scale: 4, precision: 8
    add_column :spree_dhl_shipping_methods, :opening_tariff, :decimal, scale: 4, precision: 8
  end
end
