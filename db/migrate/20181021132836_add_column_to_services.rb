class AddColumnToServices < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :priority, :integer, default: 0, null: false
  end
end
