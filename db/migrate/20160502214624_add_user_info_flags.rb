class AddUserInfoFlags < ActiveRecord::Migration
  def change
    remove_column :users, :uvendorflag, :binary
    remove_column :users, :uvehicleflag, :binary
    remove_column :users, :uimpressionflag, :binary
    remove_column :users, :ueducatorflag, :binary
    
    add_column :users, :uvendorflag, :integer
    add_column :users, :uvehicleflag, :integer
    add_column :users, :uimpressionflag, :integer
    add_column :users, :ueducatorflag, :integer
  end
end
