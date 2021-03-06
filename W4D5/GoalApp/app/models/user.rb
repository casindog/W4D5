class User < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :password, length: {minimum: 6, null_allow: true}
  attr_reader :password

  after_initialize :ensure_session_token

  def self.find_by_credentials(name)
    User.find_by(name: name)
  end

  def generate_session_token
    SecureRandom.urlsafe_base64
  end

  def ensure_session_token
    self.session_token ||= generate_session_token
  end
 
  def reset_session_token!
    self.session_token = generate_session_token
    self.save
    self.session_token
  end

  def password=(password)
  
    #what is the point of this?
    @password = password

    #that checks password is password?
    #uses is_password?
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end


end
