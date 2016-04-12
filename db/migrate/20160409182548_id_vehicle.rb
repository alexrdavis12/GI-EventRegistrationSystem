class IdVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :vid, :integer
    add_column :vehicles, :uid, :integer
  end
end
