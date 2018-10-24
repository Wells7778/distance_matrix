class ChangeTableNameToDistance < ActiveRecord::Migration[5.1]
  def change
    rename_table "distances", "lists"
    change_column :results, :distance, :integer
  end
end
