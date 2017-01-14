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

ActiveRecord::Schema.define(version: 20170114173253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "ads", force: :cascade do |t|
    t.string   "cover"
    t.string   "title"
    t.string   "url"
    t.integer  "click_count"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "status"
  end

  create_table "attachments", force: :cascade do |t|
    t.string   "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "children", force: :cascade do |t|
    t.string   "name"
    t.string   "serial_number"
    t.integer  "gender"
    t.datetime "supported_at"
    t.datetime "support_until"
    t.integer  "supporter_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "description"
    t.datetime "birthday"
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "subtitle"
    t.text     "content"
    t.integer  "status",       default: 0
    t.datetime "publish_date"
    t.string   "cover"
    t.string   "video"
    t.string   "author"
    t.integer  "view_count",   default: 0
    t.string   "category"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "photographer"
  end

  create_table "settings", force: :cascade do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

  create_table "updates", force: :cascade do |t|
    t.datetime "update_time"
    t.float    "attendence_rate"
    t.integer  "reading_report_amount"
    t.integer  "grade"
    t.integer  "family_income"
    t.float    "weight"
    t.float    "height"
    t.float    "study_hours"
    t.text     "comment"
    t.string   "support_proof"
    t.string   "photo",                 default: [],              array: true
    t.string   "video"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "child_id"
    t.string   "current_school"
    t.string   "current_grade"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "phone_number"
    t.string   "address"
    t.string   "zipcode"
    t.string   "receipt_url"
    t.datetime "support_date"
    t.boolean  "need_receipt",           default: true
    t.datetime "paid_at"
    t.integer  "receipt_state",          default: 0
    t.integer  "current_state",          default: 0
    t.integer  "money"
    t.integer  "role",                   default: 0
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
