class AddTablesForUnitaffiliation < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.integer :cid
      t.integer :unitid
      t.string :uname
      t.string :uside
      t.integer :utotalmembers
      t.string :udescription
    end
    create_table :impressions do |t|
     t.integer :uid
     t.integer :unitid
     t.string :iname
     t.string :iside
     t.string :iwar
     t.string :idescription
     t.integer :cid
    end
    create_table :commander do |t|
     t.integer :uid
     t.integer :cid
    end
    create_table :vendorbooths do |t|
     t.integer :uid
     t.integer :boothid
     t.string :vbname
     t.string :vbdescription
    end
    create_table :educator do |t|
     t.integer :uid
     t.integer :edid
     t.string :edname
     t.string :eddescription
     t.integer :edtotalnumber
     t.string :edorganization
    end
  end
end
