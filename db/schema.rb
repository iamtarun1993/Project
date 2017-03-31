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

ActiveRecord::Schema.define(version: 20170321125208) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "username"
    t.string   "password"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "all_salaries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "emp_id"
    t.integer  "year"
    t.integer  "month"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emp_id"], name: "emp_id", using: :btree
  end

  create_table "employeeatdncs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "emp_id"
    t.date     "date"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emp_id"], name: "emp_id", using: :btree
  end

  create_table "employeedtls", primary_key: "emp_id", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "designation"
    t.date     "joindate"
    t.bigint   "contactno"
    t.string   "emailid"
    t.string   "address"
    t.integer  "salary"
    t.date     "dob"
    t.string   "city"
    t.string   "state"
    t.integer  "pincode"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "holiday_extras", primary_key: "date", id: :date, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "holiday_sundays", primary_key: "date", id: :date, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "all_salaries", "employeedtls", column: "emp_id", primary_key: "emp_id", name: "all_salaries_ibfk_1"
  add_foreign_key "employeeatdncs", "employeedtls", column: "emp_id", primary_key: "emp_id", name: "employeeatdncs_ibfk_1"
end
