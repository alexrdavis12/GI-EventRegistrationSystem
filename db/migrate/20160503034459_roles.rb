class Roles < ActiveRecord::Migration
  def change
    remove_column :events, :evendorflag, :string
    remove_column :events, :evehicleflag, :string
    remove_column :events, :eimpressionflag, :string
    remove_column :events, :eeducatorflag, :string
    add_column :events, :evendorflag, :integer
    add_column :events, :evehicleflag, :integer
    add_column :events, :eimpressionflag, :integer
    add_column :events, :eeducatorflag, :integer
  end
end
