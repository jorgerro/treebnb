
EVENTS = {
  1 => :new_user_review,
  2 => :new_room_review,
  3 => :new_room_request,
  4 => :request_approved,
  5 => :request_denied
}

EVENT_IDS = EVENTS.invert

MAKE_NICE = {
  "new_york" => "New York",
  "los_angeles" => "Los Angeles",
  "kyoto" => "Kyoto",
  "seoul" => "Seoul",
  "tree_house" => "Tree House",
  "cabin" => "Cabin",
  "boat" => "Boat",
  "masterpiece" => "Masterpiece"
}
