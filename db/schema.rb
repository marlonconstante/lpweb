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

ActiveRecord::Schema.define(version: 20150629174241) do

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.integer  "sector_id"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "employees", ["location_id"], name: "index_employees_on_location_id"
  add_index "employees", ["sector_id"], name: "index_employees_on_sector_id"

  create_table "equipment", force: :cascade do |t|
    t.string   "serial_number"
    t.string   "name"
    t.string   "description"
    t.integer  "employee_id"
    t.integer  "equipment_type_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "equipment", ["employee_id"], name: "index_equipment_on_employee_id"
  add_index "equipment", ["equipment_type_id"], name: "index_equipment_on_equipment_type_id"

  create_table "equipment_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "xreflendings", force: :cascade do |t|
    t.integer  "equipment_id"
    t.integer  "employee_id"
    t.datetime "lend_date"
    t.datetime "return_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "xreflendings", ["employee_id"], name: "index_xreflendings_on_employee_id"
  add_index "xreflendings", ["equipment_id"], name: "index_xreflendings_on_equipment_id"

end
