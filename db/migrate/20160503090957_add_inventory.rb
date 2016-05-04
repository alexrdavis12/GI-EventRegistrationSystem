class AddInventory < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :uid
      t.integer :eid
      t.string :inventvid
      t.string :inventedid
      t.string :inventviid
      t.string :inventvbid
    end
  end
end
