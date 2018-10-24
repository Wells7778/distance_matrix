class FixHerokuPg < ActiveRecord::Migration[5.1]
  def change
    remove_column :results, :distance
    add_column :results, :distance, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
