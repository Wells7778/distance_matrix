class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.integer :service_id
      t.integer :distance_id
      t.text :responds

      t.timestamps
    end
  end
end
