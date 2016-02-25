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

ActiveRecord::Schema.define(version: 20160225005019) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "number"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country",      default: "USA"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "homeOwner_id"
  end

  add_index "addresses", ["homeOwner_id"], name: "index_addresses_on_homeOwner_id", using: :btree

  create_table "home_owners", force: :cascade do |t|
    t.string   "firstName"
    t.string   "lastName"
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

  create_table "issues", force: :cascade do |t|
    t.datetime "date"
    t.boolean  "lien"
    t.boolean  "resolved"
    t.text     "note"
    t.string   "picture"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "address_id"
    t.integer  "homeOwner_id"
    t.integer  "letter_id"
    t.integer  "user_id"
    t.integer  "issueCategory_id"
    t.string   "image"
  end

  add_index "issues", ["address_id"], name: "index_issues_on_address_id", using: :btree
  add_index "issues", ["homeOwner_id"], name: "index_issues_on_homeOwner_id", using: :btree
  add_index "issues", ["issueCategory_id"], name: "index_issues_on_issueCategory_id", using: :btree
  add_index "issues", ["letter_id"], name: "index_issues_on_letter_id", using: :btree
  add_index "issues", ["user_id"], name: "index_issues_on_user_id", using: :btree

  create_table "letters", force: :cascade do |t|
    t.integer  "letterNum"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
