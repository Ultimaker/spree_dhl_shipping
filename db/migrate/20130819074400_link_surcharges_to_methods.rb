class LinkSurchargesToMethods < ActiveRecord::Migration
  def up
    add_column :spree_dhl_surcharges, :dhl_shipping_method_id, :integer
    remove_column :spree_dhl_surcharges, :method
  end

  def down
    add_column :spree_dhl_surcharges, :method, :string
    remove_column :spree_dhl_surcharges, :dhl_shipping_method_id
  end
end
