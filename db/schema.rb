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

ActiveRecord::Schema.define(version: 20140901193131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.string   "phone"
    t.integer  "category_id"
    t.string   "email"
    t.string   "contact_person"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["category_id"], name: "index_clients_on_category_id", using: :btree

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "lat"
    t.string   "long"
    t.string   "ip"
    t.integer  "geolocatable_id"
    t.string   "geolocatable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "details"
    t.decimal  "fees",        precision: 2, scale: 0
    t.string   "area"
    t.string   "kind"
    t.text     "activities"
    t.text     "keyword"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subcategories", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id", using: :btree

  create_table "subcategorizations", force: true do |t|
    t.integer  "subcategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "place_id"
  end

  add_index "subcategorizations", ["place_id"], name: "index_subcategorizations_on_place_id", using: :btree
  add_index "subcategorizations", ["subcategory_id"], name: "index_subcategorizations_on_subcategory_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                        default: "",    null: false
    t.string   "encrypted_password",           default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "otp_secret_key"
    t.integer  "second_factor_attempts_count", default: 0
    t.string   "name"
    t.boolean  "phone_verified",               default: false
    t.date     "DateOfBirth"
    t.string   "nationality"
    t.string   "phone"
    t.string   "gender"
    t.boolean  "admin"
    t.boolean  "client"
    t.string   "role"
    t.integer  "geolocatable_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["geolocatable_id"], name: "index_users_on_geolocatable_id", using: :btree
  add_index "users", ["otp_secret_key"], name: "index_users_on_otp_secret_key", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "clients", "categories", name: "clients_category_id_fk"

  add_foreign_key "identities", "users", name: "identities_user_id_fk"

  add_foreign_key "subcategories", "categories", name: "subcategories_category_id_fk"

  add_foreign_key "subcategorizations", "places", name: "subcategorizations_place_id_fk"
  add_foreign_key "subcategorizations", "subcategories", name: "subcategorizations_subcategory_id_fk"

end
