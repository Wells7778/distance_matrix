class ChangeTableNameToDistance < ActiveRecord::Migration[5.1]
  def change
    rename_table "distances", "lists"
  end
end
