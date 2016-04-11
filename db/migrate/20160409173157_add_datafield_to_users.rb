class AddDatafieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hasvehicle, :integer
    add_index :users, :hasvehicle
    add_column :users, :unit, :string
    add_index :users, :unit
    add_column :users, :isco, :integer
    add_index :users, :isco
    
    create_table :vehicles do |t|
      t.string :name
      t.string :class
      t.string :nation
      t.string :war
      t.string :description
    end
  end
end
