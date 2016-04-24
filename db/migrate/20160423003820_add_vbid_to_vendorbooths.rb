class AddVbidToVendorbooths < ActiveRecord::Migration
  def change
    add_column :vendorbooths, :vbid, :integer
  end
end
