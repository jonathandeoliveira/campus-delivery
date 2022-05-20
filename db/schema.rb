# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_20_015835) do
  create_table "carriers", force: :cascade do |t|
    t.string "company_name"
    t.string "company_register"
    t.string "brand_name"
    t.string "city"
    t.string "state"
    t.string "adress"
    t.string "email_domain"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade do |t|
    t.float "size_min"
    t.float "size_max"
    t.float "weight_min"
    t.float "weight_max"
    t.float "km_value"
    t.integer "carrier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_prices_on_carrier_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "lincese_plate"
    t.string "brand"
    t.string "model"
    t.integer "year"
    t.integer "weight_capacity"
    t.integer "carrier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_vehicles_on_carrier_id"
  end

  add_foreign_key "prices", "carriers"
  add_foreign_key "vehicles", "carriers"
end
