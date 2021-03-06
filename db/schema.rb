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

ActiveRecord::Schema.define(version: 20150406161050) do

  create_table "sessions", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer  "duration",   limit: 4
    t.boolean  "open",       limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "station_id", limit: 4
  end

  add_index "sessions", ["station_id"], name: "index_sessions_on_station_id", using: :btree

  create_table "stations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mac_addr",   limit: 255
    t.datetime "last_seen"
    t.boolean  "ignore",     limit: 1,   default: false
  end

end
