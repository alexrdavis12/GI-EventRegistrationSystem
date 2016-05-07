class AddUserInfoFlags < ActiveRecord::Migration
  def change
    
    add_column :users, :uvendorflag, :integer
    add_column :users, :uvehicleflag, :integer
    add_column :users, :uimpressionflag, :integer
    add_column :users, :ueducatorflag, :integer
  end
end
