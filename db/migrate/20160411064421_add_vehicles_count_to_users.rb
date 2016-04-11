class AddVehiclesCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :vehicles_count, :int
  end
end
