class User < ActiveRecord::Base
  validates :password_digest, presence: true
  validates :email, uniqueness: true, presence: true
  validates :session_token, uniqueness: true, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  attr_accessor :password

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil if user.nil?

    user.is_password?(password) ? user : nil
  end


  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
    self.session_token
  end

  has_many(
  :notes,
  foreign_key: :user_id,
  primary_key: :id,
  class_name: "Note"
  )

  private

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end

end
