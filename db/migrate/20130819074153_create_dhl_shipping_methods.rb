class CreateDhlShippingMethods < ActiveRecord::Migration
  def change
    create_table :spree_dhl_shipping_methods do |t|
      t.string :method_class
      t.string :name
      t.decimal :volume_factor, scale: 4, precision: 8
      t.decimal :volume_size_threshold, scale: 4, precision: 8
      t.decimal :per_weigh_unit, scale: 4, precision: 8
      t.decimal :opening_tariff, scale: 4, precision: 8

      t.timestamps
    end
  end
end
