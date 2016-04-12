class RenameVehicleColumns < ActiveRecord::Migration
  def change
    rename_column :vehicles, :class, :vclass
    rename_column :vehicles, :name, :vname
    rename_column :vehicles, :nation,:vnation
    rename_column :vehicles, :war, :vwar
    rename_column :vehicles, :description, :vdescription
  end
end
