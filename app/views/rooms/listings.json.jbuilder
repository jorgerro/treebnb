json.array!(@listings) do |listing|
  json.room_title listing.display_title
  json.room_url room_url(listing)
  json.manage_room_url manage_room_url(listing)
end


# json.partial!("room_requests/room_request", room_request: room_request)


#
# create_table "rooms", force: true do |t|
#   t.integer  "owner_id",            null: false
#   t.string   "home_type",           null: false
#   t.string   "room_type",           null: false
#   t.string   "address_city",        null: false
#   t.integer  "num_possible_guests", null: false
#   t.string   "title"
#   t.text     "description"
#   t.integer  "price_per_night"
#   t.integer  "num_bedrooms"
#   t.integer  "num_bathrooms"
#   t.string   "street_address"
#   t.string   "address_zip_code"
#   t.datetime "created_at"
#   t.datetime "updated_at"
#   t.float    "latitude"
#   t.float    "longitude"
#   t.string   "address_country"
#   t.string   "address_region"