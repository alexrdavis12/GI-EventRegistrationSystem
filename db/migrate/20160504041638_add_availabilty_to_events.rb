class AddAvailabiltyToEvents < ActiveRecord::Migration
  def change
    add_column :events, :eavailabilityflag, :integer
  end
end
