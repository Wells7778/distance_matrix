class AddGeoAddressToDistance < ActiveRecord::Migration[5.1]
  def change
    add_column :distances, :geo_address, :text
    add_column :distances, :post_code, :string
  end
end
