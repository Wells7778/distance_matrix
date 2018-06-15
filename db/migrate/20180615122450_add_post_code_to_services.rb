class AddPostCodeToServices < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :post_code, :integer
  end
end
