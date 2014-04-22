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

ActiveRecord::Schema.define(version: 20140421211104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "room_requests", force: true do |t|
    t.integer  "guest_id",   null: false
    t.integer  "room_id",    null: false
    t.date     "start_date", null: false
    t.date     "end_date",   null: false
    t.string   "status",     null: false
    t.integer  "num_guests", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "room_requests", ["guest_id"], name: "index_room_requests_on_guest_id", using: :btree
  add_index "room_requests", ["room_id"], name: "index_room_requests_on_room_id", using: :btree

  create_table "rooms", force: true do |t|
    t.integer  "owner_id",             null: false
    t.string   "home_type",            null: false
    t.string   "room_type",            null: false
    t.string   "address_city",         null: false
    t.integer  "num_possible_guests",  null: false
    t.string   "title"
    t.text     "description"
    t.integer  "price_per_night"
    t.integer  "num_bedrooms"
    t.integer  "num_bathrooms"
    t.string   "address_neighborhood"
    t.string   "street_address"
    t.string   "address_zip_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rooms", ["owner_id"], name: "index_rooms_on_owner_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "fname",           null: false
    t.string   "lname",           null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.text     "description"
    t.string   "gender"
    t.date     "birthdate"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree

end
