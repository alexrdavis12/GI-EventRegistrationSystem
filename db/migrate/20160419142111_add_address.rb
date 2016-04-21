class AddAddress < ActiveRecord::Migration
  def change
    add_column :users, :addressline1, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
  end
end
