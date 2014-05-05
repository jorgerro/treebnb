json.(room_request, :id, :start_date, :end_date, :status, :num_guests)






t.integer  "guest_id"
t.integer  "room_id"
t.date     "start_date"
t.date     "end_date"
t.string   "status"
t.integer  "num_guests"
t.datetime "created_at"
t.datetime "updated_at"