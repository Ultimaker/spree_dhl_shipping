class CreateDhlShippingZones < ActiveRecord::Migration
  def change
    create_table :spree_dhl_shipping_zones do |t|
      t.string :method
      t.string :name

      t.timestamps
    end
  end
end
