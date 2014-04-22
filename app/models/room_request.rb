
class RoomRequest < ActiveRecord::Base

  validates :num_guests, :start_date, :end_date, presence: true

  belongs_to(
    :guest,
    class_name: "User",
    foreign_key: :guest_id,
    primary_key: :id  )

  belongs_to(
    :room,
    class_name: "Room",
    foreign_key: :room_id,
    primary_key: :id  )






end
