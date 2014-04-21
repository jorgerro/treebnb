
class User < ActiveRecord::Base

  before_validation :ensure_session_token

  validates :email,:session_token, presence: true, uniqueness: :true
  validates :fname, :lname, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  def User.find_by_credentials(email, secret)
    @user = User.find_by_email(email)
    return @user if @user && @user.is_password?(secret)
    nil
  end

  def User.generate_session_token
    SecureRandom::urlsafe_base64
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
