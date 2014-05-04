
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
      { host: "treebnb.herokuapp.com" }
    end
  end


  def event_name
    EVENTS[self.event_id]
  end

  def text
    message =
    case self.event_name
      when :new_user_review
        @review = self.notifiable
        "#{ @review.author.fname } #{ @review.author.lname } reviewed your profile."
      when :new_room_review
        @review = self.notifiable
        @room = @review.reviewable
        "#{ @review.author.fname } #{ @review.author.lname } reviewed #{ MAKE_NICE[@room.home_type] } in #{ MAKE_NICE[@room.address_city] }"
      when :new_room_request
        @request = self.notifiable
        @room = @request.room
        "#{ @request.guest.fname } #{ @request.guest.lname } has requested your listing: #{ @room.home_type } in #{ @room.address_city }"
      when :request_approved
        @request = self.notifiable
        @room = @request.room
        "Your request to stay at #{ @room.home_type } in #{ @room.address_city } has been accepted."
      when :request_denied
        @request = self.notifiable
        @room = @request.room
        "Your request to stay at #{ @room.home_type } in #{ @room.address_city } has been denied."
      when :new_message
        @message = self.notifiable
        @sender = @message.sender
        "You have a new message from #{ @sender.fname } #{ @sender.lname }."
      end
    return message
  end

  def url
    @url = '#'
    case self.event_name
    when :new_user_review
      @review = self.notifiable
      @url = "#{ user_url(self.user) }"
    when :new_room_review
      @review = self.notifiable
      @room = @review.reviewable
      @url = "#{ room_url(@room) }"
    when :new_room_request
      @request = self.notifiable
      @room = @request.room
      @url = "#{ manage_room_url(@room) }"
    when :request_approved
      @request = self.notifiable
      @user = @request.guest
      @url = "#{ user_room_requests_url(@user) }"
    when :request_denied
      @request = self.notifiable
      @user = @request.guest
      @url = "#{ user_room_requests_url(@user) }"
    when :new_message
      @message = self.notifiable
      @thread = @message.thread
      @url = "#{ message_thread_url(@thread) }"
    end
    return @url
  end

end