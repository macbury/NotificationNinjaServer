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

ActiveRecord::Schema.define(version: 20140629184812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "provider",     null: false
    t.string   "uid",          null: false
    t.string   "access_token"
    t.string   "name",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_key"
  end

  add_index "accounts", ["session_key"], name: "index_accounts_on_session_key", using: :btree

  create_table "channels", force: true do |t|
    t.string   "name",                         null: false
    t.string   "subscription_token", limit: 8, null: false
    t.string   "push_token",         limit: 8, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  add_index "channels", ["account_id"], name: "index_channels_on_account_id", using: :btree
  add_index "channels", ["push_token"], name: "index_channels_on_push_token", unique: true, using: :btree
  add_index "channels", ["subscription_token"], name: "index_channels_on_subscription_token", unique: true, using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

end
