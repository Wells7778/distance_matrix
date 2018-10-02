class AddLatlngToDistances < ActiveRecord::Migration[5.1]
  def change
    add_column :distances, :latlng, :string
  end
end
