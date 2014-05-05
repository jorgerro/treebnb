json.array!(@room_requests) do |room_request|
  json.partial!("room_requests/room_request", room_request: room_request)
end
