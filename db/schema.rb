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

ActiveRecord::Schema.define(version: 20130718004555) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "brands", force: true do |t|
    t.string "name", null: false
  end

  add_index "brands", ["name"], name: "brands_name_index", using: :btree

  create_table "carmodels", force: true do |t|
    t.boolean "enabled",  default: true
    t.string  "name"
    t.integer "serie_id"
  end

  add_index "carmodels", ["name"], name: "carmodels_name_index", using: :btree
  add_index "carmodels", ["serie_id"], name: "carmodels_serie_id_index", using: :btree

  create_table "cars", force: true do |t|
    t.boolean "enabled",     default: true
    t.string  "highlights",                 null: false
    t.string  "image"
    t.string  "modelName",                  null: false
    t.integer "orderKey",    default: 0
    t.integer "year",        default: 0,    null: false
    t.integer "carModel_id"
  end

  add_index "cars", ["carModel_id"], name: "cars_carModel_id_index", using: :btree
  add_index "cars", ["highlights"], name: "cars_highlights_index", using: :btree
  add_index "cars", ["modelName"], name: "cars_modelName_index", using: :btree
  add_index "cars", ["orderKey"], name: "cars_orderKey_index", using: :btree
  add_index "cars", ["year"], name: "cars_year_index", using: :btree

  create_table "comparatives", force: true do |t|
    t.integer "comparedCar_id"
    t.integer "specification_id"
  end

  add_index "comparatives", ["comparedCar_id"], name: "comparatives_comparedCar_id_index", using: :btree
  add_index "comparatives", ["specification_id"], name: "comparatives_specification_id_index", using: :btree

  create_table "comparedcars", force: true do |t|
    t.string  "image"
    t.string  "modelName",             null: false
    t.integer "year",      default: 0, null: false
    t.integer "brand_id"
  end

  add_index "comparedcars", ["brand_id"], name: "comparedcars_brand_id_index", using: :btree
  add_index "comparedcars", ["image"], name: "comparedcars_image_index", using: :btree
  add_index "comparedcars", ["modelName"], name: "comparedcars_modelName_index", using: :btree
  add_index "comparedcars", ["year"], name: "comparedcars_year_index", using: :btree

  create_table "comparedfeatures", force: true do |t|
    t.string  "descr"
    t.integer "comparative_id"
    t.integer "feature_id"
  end

  add_index "comparedfeatures", ["comparative_id"], name: "comparedfeatures_comparative_id_index", using: :btree
  add_index "comparedfeatures", ["feature_id"], name: "comparedfeatures_feature_id_index", using: :btree

  create_table "features", force: true do |t|
    t.string  "additionalInfo"
    t.string  "descr"
    t.boolean "highlighted",      default: false
    t.string  "name"
    t.integer "specification_id"
  end

  add_index "features", ["descr"], name: "features_descr_index", using: :btree
  add_index "features", ["name"], name: "features_name_index", using: :btree
  add_index "features", ["specification_id"], name: "features_specification_id_index", using: :btree

  create_table "in_app_purchase_products", force: true do |t|
    t.string   "product_identifier",                null: false
    t.string   "type",                              null: false
    t.string   "title",                             null: false
    t.string   "description"
    t.float    "price"
    t.string   "price_locale"
    t.boolean  "is_enabled",         default: true
    t.tsvector "tsv"
  end

  add_index "in_app_purchase_products", ["product_identifier"], name: "in_app_purchase_products_product_identifier_index", using: :btree
  add_index "in_app_purchase_products", ["tsv"], name: "in_app_purchase_products_tsv_index", using: :gin
  add_index "in_app_purchase_products", ["type"], name: "in_app_purchase_products_type_index", using: :btree

  create_table "in_app_purchase_receipts", force: true do |t|
    t.integer  "quantity"
    t.string   "product_id",                  null: false
    t.string   "transaction_id",              null: false
    t.datetime "purchase_date",               null: false
    t.string   "original_transaction_id"
    t.datetime "original_purchase_date"
    t.string   "app_item_id"
    t.string   "version_external_identifier"
    t.string   "bid"
    t.string   "bvrs"
    t.inet     "ip_address"
    t.datetime "created_at"
    t.tsvector "tsv"
  end

  add_index "in_app_purchase_receipts", ["app_item_id"], name: "in_app_purchase_receipts_app_item_id_index", using: :btree
  add_index "in_app_purchase_receipts", ["product_id"], name: "in_app_purchase_receipts_product_id_index", using: :btree
  add_index "in_app_purchase_receipts", ["transaction_id"], name: "in_app_purchase_receipts_transaction_id_index", using: :btree
  add_index "in_app_purchase_receipts", ["tsv"], name: "in_app_purchase_receipts_tsv_index", using: :gin

  create_table "in_app_purchase_schema_info", id: false, force: true do |t|
    t.integer "version", default: 0, null: false
  end

  create_table "lines", force: true do |t|
    t.string  "descr"
    t.string  "name",   null: false
    t.integer "car_id"
  end

  add_index "lines", ["car_id"], name: "lines_car_id_index", using: :btree
  add_index "lines", ["name"], name: "lines_name_index", using: :btree

  create_table "newsstand_issues", force: true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "summary"
    t.text     "tags",         array: true
    t.hstore   "metadata"
    t.hstore   "cover_urls"
    t.text     "asset_urls",   array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published_at"
    t.datetime "expires_at"
    t.tsvector "tsv"
  end

  add_index "newsstand_issues", ["name"], name: "newsstand_issues_name_index", using: :btree
  add_index "newsstand_issues", ["name"], name: "newsstand_issues_name_key", unique: true, using: :btree
  add_index "newsstand_issues", ["published_at"], name: "newsstand_issues_published_at_index", using: :btree
  add_index "newsstand_issues", ["tsv"], name: "newsstand_issues_tsv_index", using: :gin

  create_table "newsstand_schema_info", id: false, force: true do |t|
    t.integer "version", default: 0, null: false
  end

  create_table "offers", force: true do |t|
    t.string   "body"
    t.boolean  "enabled",    default: true
    t.string   "image"
    t.string   "largeImage"
    t.string   "title",                     null: false
    t.string   "url"
    t.datetime "validUntil",                null: false
  end

  add_index "offers", ["body"], name: "offers_body_index", using: :btree
  add_index "offers", ["title"], name: "offers_title_index", using: :btree
  add_index "offers", ["validUntil"], name: "offers_validUntil_index", using: :btree

  create_table "passbook_passes", force: true do |t|
    t.string   "pass_type_identifier"
    t.string   "serial_number"
    t.string   "authentication_token"
    t.hstore   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.tsvector "tsv"
  end

  add_index "passbook_passes", ["pass_type_identifier"], name: "passbook_passes_pass_type_identifier_index", using: :btree
  add_index "passbook_passes", ["pass_type_identifier"], name: "passbook_passes_pass_type_identifier_key", unique: true, using: :btree
  add_index "passbook_passes", ["serial_number"], name: "passbook_passes_serial_number_index", using: :btree
  add_index "passbook_passes", ["tsv"], name: "passbook_passes_tsv_index", using: :gin

  create_table "passbook_registrations", force: true do |t|
    t.integer  "pass_id",                   limit: 8, null: false
    t.string   "device_library_identifier"
    t.string   "push_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "passbook_registrations", ["device_library_identifier"], name: "passbook_registrations_device_library_identifier_index", using: :btree

  create_table "passbook_schema_info", id: false, force: true do |t|
    t.integer "version", default: 0, null: false
  end

  create_table "push_notification_devices", force: true do |t|
    t.string   "token"
    t.string   "alias"
    t.integer  "badge",      default: 0,     null: false
    t.string   "locale"
    t.string   "language"
    t.string   "timezone",   default: "UTC"
    t.inet     "ip_address"
    t.float    "lat"
    t.float    "lng"
    t.text     "tags",                                    array: true
    t.tsvector "tsv"
  end

  add_index "push_notification_devices", ["alias"], name: "push_notification_devices_alias_index", using: :btree
  add_index "push_notification_devices", ["lat", "lng"], name: "push_notification_devices_lat_lng_index", using: :btree
  add_index "push_notification_devices", ["token"], name: "push_notification_devices_token_index", using: :btree
  add_index "push_notification_devices", ["token"], name: "push_notification_devices_token_key", unique: true, using: :btree
  add_index "push_notification_devices", ["tsv"], name: "push_notification_devices_tsv_index", using: :gin

  create_table "push_notification_schema_info", id: false, force: true do |t|
    t.integer "version", default: 0, null: false
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "series", force: true do |t|
    t.boolean "enabled",  default: true
    t.string  "name",                    null: false
    t.integer "brand_id"
  end

  add_index "series", ["brand_id"], name: "series_brand_id_index", using: :btree
  add_index "series", ["name"], name: "series_name_index", using: :btree

  create_table "specifications", force: true do |t|
    t.string  "descr",                null: false
    t.string  "image"
    t.integer "car_id"
    t.integer "specificationType_id"
  end

  add_index "specifications", ["car_id"], name: "specifications_car_id_index", using: :btree
  add_index "specifications", ["specificationType_id"], name: "specifications_specificationType_id_index", using: :btree

  create_table "specificationtypes", force: true do |t|
    t.string "name"
  end

  add_index "specificationtypes", ["name"], name: "specificationtypes_name_index", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",               default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
