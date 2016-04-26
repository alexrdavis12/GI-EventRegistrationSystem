class ChangeTypeUnitid < ActiveRecord::Migration
  def change
    change_column :impressions, :unitid, :string
  end
end
