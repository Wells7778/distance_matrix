class CreateInterchanges < ActiveRecord::Migration[5.1]
  def change
    create_table :interchanges do |t|
      t.string :name
      t.string :cityNW
      t.string :citySE
      t.integer :km
      t.string :coordsNW
      t.string :coordsSE
      t.integer :freeway_id

      t.timestamps
    end
  end
end
