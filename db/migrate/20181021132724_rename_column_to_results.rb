class RenameColumnToResults < ActiveRecord::Migration[5.1]
  def change
    rename_column :results, :distance_id, :list_id
  end
end
