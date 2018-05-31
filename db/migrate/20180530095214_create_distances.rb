class CreateDistances < ActiveRecord::Migration[5.1]
  def change
    create_table :distances do |t|
      t.string :address
      t.timestamps
    end
  end
end
