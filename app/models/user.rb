class User < ActiveRecord::Base

  has_many :tweets, dependent: :delete_all

  has_many :followers,
    class_name: "Follow",
    foreign_key: :user_id,
    primary_key: :id

  has_many :followings,
    class_name: "Follow",
    foreign_key: :follower_id,
    primary_key: :id

  validates :username, :session_token, presence: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true}

  attr_reader :password
  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
