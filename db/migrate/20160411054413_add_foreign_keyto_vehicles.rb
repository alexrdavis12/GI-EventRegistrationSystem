class AddForeignKeytoVehicles < ActiveRecord::Migration
  def change
    rename_column :vehicles, :uid, :user_id
    add_index :vehicles, :user_id
  end
end
