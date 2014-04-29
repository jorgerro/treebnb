
class Room < ActiveRecord::Base

  # include Geocoder::Model::Mongoid

  include Reviewable

  validates :home_type, :room_type, presence: true
  validates :num_possible_guests, :address_zip_code, presence: true
  # validates :address_neighborhood, presence: true
  # validates :street_address, :address_zip_code, presence: true
  # can fill out these fields after creating the listing

  geocoded_by :full_address
  after_validation :geocode

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

    has_many :availabilities, inverse_of: :room, dependent: :destroy

    has_many :pictures, inverse_of: :room, dependent: :destroy

    def full_address
      #"#{ self.address_city }
      self.address_zip_code
    end

    def display_title
      self.title ? self.title :
      "#{ MAKE_NICE[self.home_type] } in #{
      MAKE_NICE.has_key?(self.address_city) ?  MAKE_NICE[self.address_city] : self.address_city }"
    end


end