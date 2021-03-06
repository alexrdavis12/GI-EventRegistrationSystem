# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160504041638) do

  create_table "answers", force: :cascade do |t|
    t.integer  "eid"
    t.integer  "uid"
    t.integer  "qid"
    t.string   "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "qtitle"
  end

  create_table "commanders", force: :cascade do |t|
    t.integer "uid"
    t.integer "cid"
  end

  create_table "educators", force: :cascade do |t|
    t.integer "uid"
    t.integer "edid"
    t.string  "edschooltype"
    t.string  "edpgaurdianname"
    t.string  "edpgaurdianphone"
    t.string  "edgaurdianemail"
    t.string  "edschoolname"
    t.string  "edaddress"
    t.string  "edzip"
    t.string  "edprimaryemail"
    t.string  "edprimaryname"
    t.string  "edprimaryrole"
    t.string  "edprimaryphone"
    t.string  "edprinciplename"
    t.string  "edprincipleemail"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "eid"
    t.string   "etitle"
    t.string   "elocation"
    t.date     "estart"
    t.date     "eend"
    t.text     "edescription"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "evendorflag"
    t.integer  "evehicleflag"
    t.integer  "eimpressionflag"
    t.integer  "eeducatorflag"
    t.integer  "eavailabilityflag"
  end

  create_table "impressions", force: :cascade do |t|
    t.integer "uid"
    t.string  "unitid"
    t.string  "iname"
    t.string  "iside"
    t.string  "iwar"
    t.string  "idescription"
    t.integer "cid"
    t.integer "iid"
    t.string  "commander"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "uid"
    t.integer "eid"
    t.string  "inventvid"
    t.string  "inventedid"
    t.string  "inventviid"
    t.string  "inventvbid"
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "qid"
    t.integer  "eid"
    t.text     "qtitle"
    t.string   "qtype"
    t.string   "qoption"
    t.integer  "qparentid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "parentopt"
  end

  create_table "units", force: :cascade do |t|
    t.integer "cid"
    t.integer "unitid"
    t.string  "uname"
    t.string  "uside"
    t.integer "utotalmembers"
    t.string  "udescription"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "lastname"
    t.string   "firstname"
    t.string   "gender"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "salt"
    t.string   "encrypted_password"
    t.integer  "level"
    t.string   "zipcode"
    t.integer  "hasvehicle"
    t.string   "unit"
    t.integer  "isco"
    t.integer  "vehicles_count"
    t.string   "phonenumber"
    t.string   "addressline1"
    t.string   "city"
    t.string   "state"
    t.integer  "uvendorflag"
    t.integer  "uvehicleflag"
    t.integer  "uimpressionflag"
    t.integer  "ueducatorflag"
  end

  add_index "users", ["hasvehicle"], name: "index_users_on_hasvehicle"
  add_index "users", ["isco"], name: "index_users_on_isco"
  add_index "users", ["unit"], name: "index_users_on_unit"

  create_table "vehicles", force: :cascade do |t|
    t.string  "vname"
    t.string  "vclass"
    t.string  "vnation"
    t.string  "vwar"
    t.string  "vdescription"
    t.integer "vid"
    t.integer "user_id"
  end

  add_index "vehicles", ["user_id"], name: "index_vehicles_on_user_id"

  create_table "vendorbooths", force: :cascade do |t|
    t.integer "uid"
    t.integer "boothid"
    t.string  "vbname"
    t.string  "vbdescription"
    t.integer "vbid"
    t.integer "vbspaces"
  end

end
