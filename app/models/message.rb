
class Message < ActiveRecord::Base

  before_validation :ensure_thread_id
  validates :sender_id, :recipient_id, :body, presence: true
  before_create :ensure_not_read
  after_create :new_message_notification

  scope :unread, -> { where( is_read: false ) }

  belongs_to(
    :sender,
    class_name: "User",
    foreign_key: :sender_id,
    primary_key: :id  )

  belongs_to(
    :recipient,
    class_name: "User",
    foreign_key: :recipient_id,
    primary_key: :id  )

  belongs_to(
    :thread,
    class_name: "MessageThread",
    foreign_key: :thread_id,
    primary_key: :id  )

    has_many :notifications, as: :notifiable, dependent: :destroy

    def new_message_notification
      self.notifications.unread.create!({
        event_id: EVENT_IDS[:new_message], user_id: self.recipient_id })
    end

  private

    def ensure_not_read
      self.is_read = false
      @thread = MessageThread.find_or_create_by_user_ids(self.sender_id, self.recipient_id)
      self.thread_id = @thread.id
    end

    def ensure_thread_id
      unless self.thread_id
        @thread = MessageThread.find_or_create_by_user_ids(self.sender_id, self.recipient_id)
        self.thread_id = @thread.id
      end
    end

end
