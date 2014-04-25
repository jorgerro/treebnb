
class Notification < ActiveRecord::Base

  include Rails.application.routes.url_helpers

  scope :unread, -> { where( is_read: false ) }

  belongs_to :user

  validates(:event_id,
    :user_id,
    :notifiable_id,
    :notifiable_type,
    presence: true)

  belongs_to :notifiable, polymorphic: true

  def default_url_options
    if Rails.env.development?
      { host: "localhost:3000" }
    else
      { host: "freebnb.herokuapp.com" }
    end
  end


  def event_name
    EVENTS[self.event_id]
  end

  def text
    message =
    case self.event_name
      when :new_user_review
        @review = Review.find(self.notifiable_id)
        "#{ @review.author.fname } #{ @review.author.lname } reviewed your profile."
      when :new_room_review
        @review = Review.find(self.notifiable_id)
        @room = Room.find(@review.reviewable_id)
        "#{ @review.author.fname } #{ @review.author.lname } reviewed #{ @room.home_type } in #{ @room.address_city }"
      when :new_room_request
        @request = RoomRequest.find(self.notifiable_id)
        @room = Room.find(@request.room_id)
        "#{ @request.guest.fname } #{ @request.guest.lname } has requested your listing: #{ @room.home_type } in #{ @room.address_city }"
      when :request_approved
        @request = RoomRequest.find(self.notifiable_id)
        @room = Room.find(@request.room_id)
        "Your request to stay at #{ @room.home_type } in #{ @room.address_city } has been accepted."
      when :request_denied
        @request = RoomRequest.find(self.notifiable_id)
        @room = Room.find(@request.room_id)
        "Your request to stay at #{ @room.home_type } in #{ @room.address_city } has been denied."
      end
    return message
  end

  def url
    @url = '#'
    case self.event_name
    when :new_user_review
      @review = Review.find(self.notifiable_id)
      @url = "#{ user_url(self.user) }"
    when :new_room_review
      @review = Review.find(self.notifiable_id)
      @room = Room.find(@review.reviewable_id)
      @url = "#{ room_url(@room) }"
    when :new_room_request
      @request = RoomRequest.find(self.notifiable_id)
      @room = Room.find(@request.room_id)
      @url = "#{ room_url(@room) }"
    when :request_approved
      @request = RoomRequest.find(self.notifiable_id)
      @user = User.find(@request.guest_id)
      @url = "#{ user_room_requests_url(@user) }"
    when :request_denied
      @request = RoomRequest.find(self.notifiable_id)
      @user = User.find(@request.guest_id)
      @url = "#{ user_room_requests_url(@user) }"
    end
    return @url
  end

end