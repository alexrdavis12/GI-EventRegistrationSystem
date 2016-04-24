class AddImpressionId < ActiveRecord::Migration
  def change
    add_column :impressions, :iid, :int
    rename_table :commander, :commanders
    rename_table :educator, :educators
  end
end
