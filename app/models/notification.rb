
class Notification < ActiveRecord::Base

  belongs_to :user

  validates(:event_id,
    :user_id,
    :notifiable_id,
    :notifiable_type,
    presence: true)

  validates :status, inclusion: { in: %w(UNREAD READ) }

  def text
    message =
    case self.event_id
    when 1
      @review = Review.find(self.notifiable_id)
      "#{ @review.author.fname } reviewed your profile."
    when 2
      @review = Review.find(self.notifiable_id)
      @room = Room.find(@review.reviewable_id)
      "#{ @review.author.fname } reviewed #{ room.home_type } in #{ room.address_city }"
    when 3
      # continue this trend
    when 4
    when 5

  end

  def url
    # fill this out with where the notification should go
  end

end