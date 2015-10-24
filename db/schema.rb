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

ActiveRecord::Schema.define(version: 20151024204838) do

  create_table "crews", force: :cascade do |t|
    t.string "name",  limit: 255
    t.string "skill", limit: 255
    t.text   "blurb", limit: 65535
    t.string "rate",  limit: 255
  end

  create_table "missions", force: :cascade do |t|
    t.text     "crime_id",     limit: 65535
    t.integer  "month",        limit: 4
    t.integer  "year",         limit: 4
    t.string   "date_string",  limit: 255
    t.text     "reported_by",  limit: 65535
    t.text     "falls_within", limit: 65535
    t.float    "longitude",    limit: 24
    t.float    "latitude",     limit: 24
    t.text     "location",     limit: 65535
    t.text     "lsoa_code",    limit: 65535
    t.text     "lsoa_name",    limit: 65535
    t.text     "crime_type",   limit: 65535
    t.text     "outcome_type", limit: 65535
    t.text     "context",      limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "twitter_accounts", force: :cascade do |t|
    t.string "twitter_handle", limit: 255
    t.string "admin_ward_id",  limit: 255
  end

  add_index "twitter_accounts", ["admin_ward_id"], name: "index_twitter_accounts_on_admin_ward_id", using: :btree

end
