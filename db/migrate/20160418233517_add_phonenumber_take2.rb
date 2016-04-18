class AddPhonenumberTake2 < ActiveRecord::Migration
  def change
    remove_column :users, :phonenumber, :integer
    add_column :users, :phonenumber, :string
  end
end
