class CreateDhlSurcharges < ActiveRecord::Migration
  def change
    create_table :spree_dhl_surcharges do |t|
      t.string :method
      t.boolean :is_absolute, default: false
      t.decimal :value, scale: 2, precision: 8

      t.timestamps
    end
  end
end
