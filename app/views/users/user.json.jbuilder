# json.user do
  json.(@user, :id, :fname, :lname, :email, :description, :gender, :phone_number, :birthdate)
# end
  # json.avatar_url user.avatar.url(:thumb)




  # json.host_url user_url(trip.host)
  # json.room_url room_url(trip.room)
  # url to cancel a request?
# json.partial!("room_requests/room_request", room_request: room_request)
