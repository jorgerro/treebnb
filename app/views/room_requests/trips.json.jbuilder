json.array!(@trips) do |trip|
  json.(trip, :id, :start_date, :end_date, :status, :num_guests)
  json.room_title trip.room.display_title
  json.host_url user_url(trip.host)
  json.room_url room_url(trip.room)
  # url to cancel a request?
end


# json.partial!("room_requests/room_request", room_request: room_request)

