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

ActiveRecord::Schema.define(version: 20131012210544) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "huddle_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "huddle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "huddles", force: true do |t|
    t.string   "skill_level",    null: false
    t.string   "size_of_huddle", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "court",          null: false
    t.integer  "creator",        null: false
    t.datetime "time_and_date",  null: false
  end

  create_table "locations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "court_name", null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "street",     null: false
    t.string   "city",       null: false
    t.string   "state",      null: false
    t.integer  "postal",     null: false
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email",                  default: "", null: false
    t.string   "skill"
    t.string   "city",                                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "huddle_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
