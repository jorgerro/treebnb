
class Notification < ActiveRecord::Base

  belongs_to :user

  validates(:event_id,
    :user_id,
    :notifiable_id,
    :notifiable_type,
    presence: true)

  validates :status, inclusion: { in: %w(UNREAD READ) }

  def generate_message

  end

end