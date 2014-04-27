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

ActiveRecord::Schema.define(version: 20140426181324) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "message_threads", force: true do |t|
    t.integer  "user_one_id", null: false
    t.integer  "user_two_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "message_threads", ["user_one_id", "user_two_id"], name: "index_message_threads_on_user_one_id_and_user_two_id", unique: true, using: :btree
  add_index "message_threads", ["user_one_id"], name: "index_message_threads_on_user_one_id", using: :btree
  add_index "message_threads", ["user_two_id"], name: "index_message_threads_on_user_two_id", using: :btree

  create_table "messages", force: true do |t|
    t.integer  "sender_id",    null: false
    t.integer  "recipient_id", null: false
    t.text     "body",         null: false
    t.boolean  "is_read",      null: false
    t.integer  "thread_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["recipient_id"], name: "index_messages_on_recipient_id", using: :btree
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id", using: :btree
  add_index "messages", ["thread_id"], name: "index_messages_on_thread_id", using: :btree

  create_table "notifications", force: true do |t|
    t.integer  "event_id",        null: false
    t.integer  "user_id",         null: false
    t.boolean  "is_read",         null: false
    t.integer  "notifiable_id",   null: false
    t.string   "notifiable_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["event_id"], name: "index_notifications_on_event_id", using: :btree
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree

  create_table "pictures", force: true do |t|
    t.integer  "room_id",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "reviews", force: true do |t|
    t.text     "body",            null: false
    t.integer  "author_id",       null: false
    t.integer  "reviewable_id",   null: false
    t.string   "reviewable_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["author_id"], name: "index_reviews_on_author_id", using: :btree
  add_index "reviews", ["reviewable_id"], name: "index_reviews_on_reviewable_id", using: :btree

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
    t.string   "fname",               null: false
    t.string   "lname",               null: false
    t.string   "email",               null: false
    t.string   "password_digest",     null: false
    t.string   "session_token",       null: false
    t.text     "description"
    t.string   "gender"
    t.date     "birthdate"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree

end
