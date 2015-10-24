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

ActiveRecord::Schema.define(version: 20151024193547) do

  create_table "admin_wards", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.string   "lsoa_code",             limit: 255
    t.string   "neighbourhood_code",    limit: 255
    t.float    "lat",                   limit: 24
    t.float    "lng",                   limit: 24
    t.integer  "all_crime",             limit: 4,   default: 0
    t.integer  "anti_social_behaviour", limit: 4,   default: 0
    t.integer  "bicycle_theft",         limit: 4,   default: 0
    t.integer  "burglary",              limit: 4,   default: 0
    t.integer  "criminal_damage_arson", limit: 4,   default: 0
    t.integer  "drugs",                 limit: 4,   default: 0
    t.integer  "other_theft",           limit: 4,   default: 0
    t.integer  "possession_of_weapons", limit: 4,   default: 0
    t.integer  "public_order",          limit: 4,   default: 0
    t.integer  "robbery",               limit: 4,   default: 0
    t.integer  "shoplifting",           limit: 4,   default: 0
    t.integer  "theft_from_the_person", limit: 4,   default: 0
    t.integer  "vehicle_crime",         limit: 4,   default: 0
    t.integer  "violent_crime",         limit: 4,   default: 0
    t.integer  "other_crime",           limit: 4,   default: 0
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "admin_wards", ["lsoa_code"], name: "index_admin_wards_on_lsoa_code", using: :btree

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
    t.string   "crime_type",   limit: 255
    t.text     "outcome_type", limit: 65535
    t.text     "context",      limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "missions", ["crime_type"], name: "index_missions_on_crime_type", using: :btree

end
