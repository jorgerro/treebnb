
class Availability < ActiveRecord::Base

  validates :room, :start_date, :end_date, presence: true

  belongs_to(
    :room,
    class_name: "Room",
    foreign_key: :room_id,
    primary_key: :id,
    inverse_of: :availabilities  )

    #this needs to be added to the conflicting dates calculation

end
