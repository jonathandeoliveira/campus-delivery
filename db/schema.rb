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

ActiveRecord::Schema[7.0].define(version: 2022_05_29_192301) do
  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "budgets", force: :cascade do |t|
    t.float "height"
    t.float "width"
    t.float "length"
    t.float "weight"
    t.integer "distance"
    t.string "query_result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "deadlines", force: :cascade do |t|
    t.integer "km_min"
    t.integer "km_max"
    t.integer "km_time"
    t.integer "carrier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_deadlines_on_carrier_id"
  end

  create_table "delivery_updates", force: :cascade do |t|
    t.integer "order_id", null: false
    t.string "coord_position"
    t.string "delivery_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_delivery_updates_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "carrier_id", null: false
    t.integer "vehicle_id"
    t.float "size"
    t.float "weight"
    t.string "customar_name"
    t.string "customer_adress"
    t.string "derparture_adress"
    t.integer "distance"
    t.string "track_number"
    t.integer "status", default: 10
    t.string "product_number"
    t.decimal "total_price"
    t.date "delivery_deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_orders_on_carrier_id"
    t.index ["vehicle_id"], name: "index_orders_on_vehicle_id"
  end

  create_table "prices", force: :cascade do |t|
    t.float "size_min"
    t.float "size_max"
    t.float "weight_min"
    t.float "weight_max"
    t.decimal "km_value"
    t.integer "carrier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_prices_on_carrier_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "carrier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_users_on_carrier_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
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

  add_foreign_key "deadlines", "carriers"
  add_foreign_key "delivery_updates", "orders"
  add_foreign_key "orders", "carriers"
  add_foreign_key "orders", "vehicles"
  add_foreign_key "prices", "carriers"
  add_foreign_key "vehicles", "carriers"
end
