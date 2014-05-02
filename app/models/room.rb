require 'active_support/inflector'

class Room < ActiveRecord::Base
  include Reviewable

  include PgSearch
  pg_search_scope :search_by_region, against: :address_region


  validates :home_type, :room_type, presence: true
  validates :num_possible_guests,  presence: true
  # :address_region, :address_country,
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

    def approved_requests
      self.room_requests.where(status: "APPROVED")
    end


    def full_address
      "#{ self.street_address }, #{ self.address_city }, #{ self.address_zip_code } #{ self.address_country }"
    end

    def display_title
      self.title ? self.title :
      "#{ ActiveSupport::Inflector.titleize(self.home_type) } in #{ self.address_city }"
    end


end