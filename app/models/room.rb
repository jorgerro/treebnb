
class Room < ActiveRecord::Base
  include Reviewable

  validates :home_type, :room_type, presence: true
  validates :num_possible_guests, :address_city, presence: true
  # validates :address_neighborhood, presence: true
  # validates :street_address, :address_zip_code, presence: true
  # can fill out these fields after creating the listing

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id  )

  has_many(
    :room_requests,
    class_name: "RoomRequest",
    foreign_key: :room_id,
    primary_key: :id,
    dependent: :destroy  )

end