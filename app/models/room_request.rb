
class RoomRequest < ActiveRecord::Base

  STATUS_STATES = [
    "APPROVED",
    "DENIED",
    "PENDING"
  ]

  validates :num_guests, :start_date, :end_date, presence: true
  validates :status, inclusion: STATUS_STATES
  validate :check_availability
  validate :does_not_overlap_approved_request

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

  has_many :notifications, as: :notifiable, dependent: :destroy

  has_one :host, through: :room, source: :owner

  def new_request_notification
    self.notifications.unread.create!({
      event_id: EVENT_IDS[:new_room_request], user_id: self.host.id })
  end

  def approved?
    self.status == "APPROVED"
  end

  def denied?
    self.status == "DENIED"
  end

  def pending?
    self.status == "PENDING"
  end

  def deny!
    self.status = "DENIED"
    self.save!
    self.notifications.unread.create!({
      event_id: EVENT_IDS[:request_denied], user_id: self.guest_id })
  end

  def approve!
    # raise "not pending" unless self.status == "PENDING"
    transaction do
      self.status = "APPROVED"
      self.save!
      self.notifications.unread.create!({
        event_id: EVENT_IDS[:request_approved], user_id: self.guest_id })

      overlapping_pending_requests.each do |req|
        req.status = "DENIED"
        req.save!
      end
    end
  end

  private

  def check_availability
    conditions = <<-SQL
      ((room_id = :room_id)
        AND (start_date <= :start_date)
        AND (end_date >= :end_date))
    SQL

    overlapping_availabilities = Availability.where(conditions, {
      room_id: self.room_id,
      start_date: self.start_date,
      end_date: self.end_date
    })

    if overlapping_availabilities.empty?
      errors[:base] << "The room is not available during those dates."
    end
  end

  def assign_pending_status
    self.status ||= "PENDING"
  end

  def overlapping_requests
    conditions = <<-SQL
      ((room_id = :room_id)
        AND (start_date <= :end_date)
        AND (end_date >= :start_date))
    SQL

    overlapping_requests = RoomRequest.where(conditions, {
      room_id: self.room_id,
      start_date: self.start_date,
      end_date: self.end_date
    })

    if self.id.nil?
      overlapping_requests
    else
      overlapping_requests.where("id != ?", self.id)
    end
  end

  def overlapping_approved_requests
    overlapping_requests.where("status = 'APPROVED'")
  end

  def overlapping_pending_requests
    overlapping_requests.where("status = 'PENDING'")
  end

  def does_not_overlap_approved_request
    return if self.denied?

    unless overlapping_approved_requests.empty?
      errors[:base] << "Request conflicts with existing approved request"
    end
  end

end
