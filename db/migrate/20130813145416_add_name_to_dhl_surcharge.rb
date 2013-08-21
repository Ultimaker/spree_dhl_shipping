class AddNameToDhlSurcharge < ActiveRecord::Migration
  def change
    add_column :spree_dhl_surcharges, :name, :string
  end
end
