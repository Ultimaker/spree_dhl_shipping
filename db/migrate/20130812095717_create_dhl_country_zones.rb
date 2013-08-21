class CreateDhlCountryZones < ActiveRecord::Migration
  def change
    create_table :spree_dhl_country_zones do |t|
      t.references :country
      t.references :shipping_zone
      t.string :zip_codes, default: ''

      t.timestamps
    end
    add_index :spree_dhl_country_zones, [:country_id, :shipping_zone_id], unique: true, name: 'index_spree_dhl_country_zones_country_shipping_zone'
  end
end
