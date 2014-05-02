
EVENTS = {
  1 => :new_user_review,
  2 => :new_room_review,
  3 => :new_room_request,
  4 => :request_approved,
  5 => :request_denied,
  6 => :new_message
}

EVENT_IDS = EVENTS.invert

REGIONS = [
  "europe",
  "north_america",
  "south_america",
  "hawaii",
  "east_asia"
]

MAKE_NICE = {
  "shared_room" => "Shared Room",
  "private_room" => "Private Room",
  "entire_space" => "Entire Space"
}

