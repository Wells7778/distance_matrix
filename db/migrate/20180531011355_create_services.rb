class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :tag
      t.string :no
      t.string :name
      t.string :lng
      t.string :lat
      t.timestamps
    end
  end
end
