class FixValueInDhlSurcharges < ActiveRecord::Migration
  def up
    change_column :spree_dhl_surcharges, :value, :decimal, scale: 4, precision: 8
  end

  def down
    change_column :spree_dhl_surcharges, :value, :decimal, scale: 2, precision: 8
  end
end
