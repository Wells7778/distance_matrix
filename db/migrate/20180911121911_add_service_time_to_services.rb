class AddServiceTimeToServices < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :service_time, :string, default: "00:00 ~ 00:00"
  end
end
