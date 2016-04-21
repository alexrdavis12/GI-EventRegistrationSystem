class AddPhonenumberTake2 < ActiveRecord::Migration
  def change
    add_column :users, :phonenumber, :string
  end
end
