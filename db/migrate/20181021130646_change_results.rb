class ChangeResults < ActiveRecord::Migration[5.1]
  def change
    change_column :results, :responds, :integer
    rename_column :results, :responds, :distance
    add_column :results, :status, :string
  end
end
