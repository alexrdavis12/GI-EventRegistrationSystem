class Roles < ActiveRecord::Migration
  def change
    add_column :events, :evendorflag, :integer
    add_column :events, :evehicleflag, :integer
    add_column :events, :eimpressionflag, :integer
    add_column :events, :eeducatorflag, :integer
  end
end
