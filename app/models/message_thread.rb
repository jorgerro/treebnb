
class MessageThread < ActiveRecord::Base

  validates :user_one_id, :user_two_id, presence: true
  validates :user_one_id, uniqueness: { scope: :user_two_id }

  has_many(
    :messages,
    class_name: "Message",
    foreign_key: :thread_id,
    primary_key: :id  )

  belongs_to(
    :user_one,
    class_name: "User",
    foreign_key: :user_one_id,
    primary_key: :id  )

  belongs_to(
    :user_two,
    class_name: "User",
    foreign_key: :user_two_id,
    primary_key: :id  )

  def MessageThread.find_or_create_by_user_ids(user_one_id, user_two_id)
    if MessageThread.exists?(user_one_id: user_one_id, user_two_id: user_two_id)
      @thread = MessageThread.find_by(user_one_id: user_one_id, user_two_id: user_two_id)
    elsif MessageThread.exists?(user_one_id: user_two_id, user_two_id: user_one_id)
      @thread = MessageThread.find_by(user_one_id: user_two_id, user_two_id: user_one_id)
    else
      MessageThread.create!(user_one_id: user_one_id, user_two_id: user_two_id)
      @thread = MessageThread.find_by(user_one_id: user_one_id, user_two_id: user_two_id)
    end
    return @thread
  end


end
