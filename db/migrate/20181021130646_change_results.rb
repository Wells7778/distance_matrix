class ChangeResults < ActiveRecord::Migration[5.1]
  def change
    rename_column :results, :responds, :distance
    add_column :results, :status, :string
  end
  def change
    change_column :results, :distance, :integer
  end
end
