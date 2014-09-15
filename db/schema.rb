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

ActiveRecord::Schema.define(version: 20140915212652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ads", force: true do |t|
    t.string   "name"
    t.string   "caption"
    t.integer  "category_id"
    t.string   "link"
    t.string   "position"
    t.string   "imagesize"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
    t.integer  "subcategory_id"
    t.string   "image"
  end

  add_index "ads", ["category_id"], name: "index_ads_on_category_id", using: :btree
  add_index "ads", ["client_id"], name: "index_ads_on_client_id", using: :btree
  add_index "ads", ["subcategory_id"], name: "index_ads_on_subcategory_id", using: :btree

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
    t.boolean  "logo_processing", default: false, null: false
    t.string   "logo"
    t.boolean  "need_analytics"
    t.text     "items"
  end

  add_index "clients", ["category_id"], name: "index_clients_on_category_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "client_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.decimal  "fee",            precision: 2, scale: 0
    t.string   "dress_code"
    t.boolean  "featured"
    t.text     "keywords"
    t.string   "reference_code"
    t.string   "link"
    t.string   "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "poster"
  end

  add_index "events", ["client_id"], name: "index_events_on_client_id", using: :btree

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "images", force: true do |t|
    t.string   "link"
    t.string   "caption"
    t.string   "description"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "img"
  end

  create_table "listings", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "client_id"
    t.boolean  "featured"
    t.text     "keywords"
    t.string   "link"
    t.boolean  "on_package"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "cost"
  end

  add_index "listings", ["client_id"], name: "index_listings_on_client_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "lat"
    t.string   "long"
    t.string   "ip"
    t.integer  "geolocatable_id"
    t.string   "geolocatable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "package_lines", force: true do |t|
    t.integer  "package_id"
    t.integer  "listing_id"
    t.time     "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "package_lines", ["listing_id"], name: "index_package_lines_on_listing_id", using: :btree
  add_index "package_lines", ["package_id"], name: "index_package_lines_on_package_id", using: :btree

  create_table "packages", force: true do |t|
    t.integer  "user_id"
    t.decimal  "amount"
    t.text     "invitees"
    t.date     "date"
    t.string   "qrcode"
    t.string   "recipient"
    t.time     "meet_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "packages", ["user_id"], name: "index_packages_on_user_id", using: :btree

  create_table "payments", force: true do |t|
    t.integer  "client_id"
    t.integer  "event_id"
    t.integer  "ad_id"
    t.integer  "listing_id"
    t.decimal  "amount",             precision: 2, scale: 0
    t.date     "valid_from"
    t.date     "valid_to"
    t.string   "reference_code"
    t.boolean  "payment_received"
    t.date     "initial_start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["ad_id"], name: "index_payments_on_ad_id", using: :btree
  add_index "payments", ["client_id"], name: "index_payments_on_client_id", using: :btree
  add_index "payments", ["event_id"], name: "index_payments_on_event_id", using: :btree
  add_index "payments", ["listing_id"], name: "index_payments_on_listing_id", using: :btree

  create_table "places", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "details"
    t.decimal  "fees",        precision: 2, scale: 0
    t.string   "area"
    t.string   "kind"
    t.text     "activities"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "keywords"
    t.boolean  "featured"
  end

  create_table "reviews", force: true do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.integer  "event_id"
    t.integer  "listing_id"
    t.integer  "place_id"
    t.decimal  "rating"
    t.text     "review"
    t.float    "popularity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["client_id"], name: "index_reviews_on_client_id", using: :btree
  add_index "reviews", ["event_id"], name: "index_reviews_on_event_id", using: :btree
  add_index "reviews", ["listing_id"], name: "index_reviews_on_listing_id", using: :btree
  add_index "reviews", ["place_id"], name: "index_reviews_on_place_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "socials", force: true do |t|
    t.string   "facebook_id"
    t.string   "twitter_id"
    t.string   "google_id"
    t.string   "foursquare_id"
    t.integer  "socialize_id"
    t.string   "socialize_type"
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
    t.integer  "event_id"
    t.integer  "listing_id"
  end

  add_index "subcategorizations", ["event_id"], name: "index_subcategorizations_on_event_id", using: :btree
  add_index "subcategorizations", ["listing_id"], name: "index_subcategorizations_on_listing_id", using: :btree
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
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["geolocatable_id"], name: "index_users_on_geolocatable_id", using: :btree
  add_index "users", ["otp_secret_key"], name: "index_users_on_otp_secret_key", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "ads", "categories", name: "ads_category_id_fk"
  add_foreign_key "ads", "clients", name: "ads_client_id_fk"
  add_foreign_key "ads", "subcategories", name: "ads_subcategory_id_fk"

  add_foreign_key "clients", "categories", name: "clients_category_id_fk"

  add_foreign_key "events", "clients", name: "events_client_id_fk"

  add_foreign_key "identities", "users", name: "identities_user_id_fk"

  add_foreign_key "listings", "clients", name: "listings_client_id_fk"

  add_foreign_key "package_lines", "listings", name: "package_lines_listing_id_fk"
  add_foreign_key "package_lines", "packages", name: "package_lines_package_id_fk"

  add_foreign_key "packages", "users", name: "packages_user_id_fk"

  add_foreign_key "payments", "ads", name: "payments_ad_id_fk"
  add_foreign_key "payments", "clients", name: "payments_client_id_fk"
  add_foreign_key "payments", "events", name: "payments_event_id_fk"
  add_foreign_key "payments", "listings", name: "payments_listing_id_fk"

  add_foreign_key "reviews", "clients", name: "reviews_client_id_fk"
  add_foreign_key "reviews", "events", name: "reviews_event_id_fk"
  add_foreign_key "reviews", "listings", name: "reviews_listing_id_fk"
  add_foreign_key "reviews", "places", name: "reviews_place_id_fk"
  add_foreign_key "reviews", "users", name: "reviews_user_id_fk"

  add_foreign_key "subcategories", "categories", name: "subcategories_category_id_fk"

  add_foreign_key "subcategorizations", "events", name: "subcategorizations_event_id_fk"
  add_foreign_key "subcategorizations", "listings", name: "subcategorizations_listing_id_fk"
  add_foreign_key "subcategorizations", "places", name: "subcategorizations_place_id_fk"
  add_foreign_key "subcategorizations", "subcategories", name: "subcategorizations_subcategory_id_fk"

end
