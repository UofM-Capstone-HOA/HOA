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

ActiveRecord::Schema.define(version: 20160502202645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "number"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country",       default: "USA"
    t.string   "postalcode",    default: "38103"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "home_owner_id", default: 1
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "addresses", ["home_owner_id"], name: "index_addresses_on_home_owner_id", using: :btree

  create_table "hoaroutes", force: :cascade do |t|
    t.float    "lat"
    t.float    "long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "hoaroutes", ["user_id"], name: "index_hoaroutes_on_user_id", using: :btree

  create_table "home_owners", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issue_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issue_status_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issues", force: :cascade do |t|
    t.datetime "date"
    t.text     "note"
    t.string   "picture"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "address_id"
    t.integer  "home_owner_id"
    t.integer  "user_id"
    t.integer  "issue_category_id"
    t.integer  "issue_status_category_id"
  end

  add_index "issues", ["address_id"], name: "index_issues_on_address_id", using: :btree
  add_index "issues", ["home_owner_id"], name: "index_issues_on_home_owner_id", using: :btree
  add_index "issues", ["issue_category_id"], name: "index_issues_on_issue_category_id", using: :btree
  add_index "issues", ["issue_status_category_id"], name: "index_issues_on_issue_status_category_id", using: :btree
  add_index "issues", ["user_id"], name: "index_issues_on_user_id", using: :btree

  create_table "letters", force: :cascade do |t|
    t.integer  "letternum"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "issue_id"
  end

  add_index "letters", ["issue_id"], name: "index_letters_on_issue_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "isadmin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "issues", "issue_status_categories"
end
