class CreateFreeways < ActiveRecord::Migration[5.1]
  def change
    create_table :freeways do |t|
      t.string :name
      t.string :direction

      t.timestamps
    end
  end
end
