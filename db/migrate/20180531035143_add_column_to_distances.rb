class AddColumnToDistances < ActiveRecord::Migration[5.1]
  def change
    add_column :distances, :respond_list, :text
  end
end
