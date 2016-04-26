class AddEducatorsTable < ActiveRecord::Migration
  def change
    drop_table :educators
    
    create_table :educators do |t|
    t.integer :uid
    t.integer :edid
    t.string :edschooltype
    t.string :edpgaurdianname
    t.string :edpgaurdianphone
    t.string :edgaurdianemail
    t.string :edschoolname
    t.string :edaddress
    t.string :edzip
    t.string :edprimaryemail
    t.string :edprimaryname
    t.string :edprimaryrole
    t.string :edprimaryphone
    t.string :edprinciplename
    t.string :edprincipleemail
    end
  end
end
