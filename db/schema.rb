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

ActiveRecord::Schema.define(version: 20190731051634) do

  create_table "settings", force: :cascade do |t|
    t.string   "theme"
    t.boolean  "new_user_registration"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string   "post_code"
    t.string   "city"
    t.string   "address2"
    t.string   "address1"
    t.string   "telephone"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicle_bodies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_brands", force: :cascade do |t|
    t.string   "name"
    t.integer  "vehicle_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["vehicle_type_id"], name: "index_vehicle_brands_on_vehicle_type_id"
  end

  create_table "vehicle_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "vehicle_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["vehicle_type_id"], name: "index_vehicle_categories_on_vehicle_type_id"
  end

  create_table "vehicle_conditions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_extras", force: :cascade do |t|
    t.string   "name"
    t.integer  "vehicle_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["vehicle_type_id"], name: "index_vehicle_extras_on_vehicle_type_id"
  end

  create_table "vehicle_fuels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_models", force: :cascade do |t|
    t.string   "name"
    t.integer  "vehicle_brand_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["vehicle_brand_id"], name: "index_vehicle_models_on_vehicle_brand_id"
  end

  create_table "vehicle_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "name"
    t.string   "brand"
    t.string   "type"
    t.string   "subCategory"
    t.string   "subType"
    t.string   "model"
    t.date     "year"
    t.string   "body"
    t.integer  "meter"
    t.string   "fuel"
    t.string   "condition"
    t.integer  "doors"
    t.integer  "seats"
    t.string   "extras"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_vehicles_on_user_id"
  end

end
