
class User < ActiveRecord::Base
  include Reviewable

  attr_reader :password

  before_validation :ensure_session_token

  validates :email,:session_token, presence: true, uniqueness: :true
  validates :fname, :lname, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  # validates :gender, inclusion: { in: %w(M F O), allow_nil: true }
  # ^ didn't allow nil

  has_many(
    :listings,
    class_name: "Room",
    foreign_key: :owner_id,
    primary_key: :id,
    dependent: :destroy  )

  has_many(
    :requests_to_stay,
    class_name: "RoomRequest",
    foreign_key: :guest_id,
    primary_key: :id,
    dependent: :destroy  )

  has_many(
    :authored_reviews,
    class_name: "Review",
    foreign_key: :author_id,
    primary_key: :id,
    dependent: :destroy  )

  has_many :room_requests, through: :listings, source: :room_requests

  has_many(
    :notifications,
    class_name: "Notification",
    foreign_key: :user_id,
    primary_key: :id  )

  has_many(
    :sent_messages,
    class_name: "Message",
    foreign_key: :sender_id,
    primary_key: :id  )

  has_many(
    :received_messages,
    class_name: "Message",
    foreign_key: :recipient_id,
    primary_key: :id  )

    def threads
      MessageThread.where("user_one_id = :id OR user_two_id = :id", id: self.id)
    end

  has_attached_file :avatar, styles: { thumb: "100x100!", profile: "230x230!" },
  default_url: "https://s3.amazonaws.com/freebnb_dev/users/avatars/000/000/default_avatar/default_avatar.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def User.find_by_credentials(email, secret)
    @user = User.find_by_email(email)
    return @user if @user && @user.is_password?(secret)
    nil
  end

  def User.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def owns_room?(room)
    room.owner_id == self.id
  end

  def password=(secret)
    @password = secret
    self.password_digest = BCrypt::Password.create(secret)
  end

  def is_password?(secret)
    bcrypt = BCrypt::Password.new(self.password_digest)
    bcrypt.is_password?(secret)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  private
    def ensure_session_token
      self.session_token ||= User.generate_session_token
    end

end
