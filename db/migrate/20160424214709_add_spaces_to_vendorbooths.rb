class AddSpacesToVendorbooths < ActiveRecord::Migration
  def change
    add_column :vendorbooths, :vbspaces, :integer
  end
end
