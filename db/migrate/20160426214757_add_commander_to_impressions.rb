class AddCommanderToImpressions < ActiveRecord::Migration
  def change
    add_column :impressions, :commander, :string
  end
end
