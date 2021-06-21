class User < ApplicationRecord
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  after_initialize :ensure_session_token


  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64 
  end

  def reset_session_token!
    self.session_token ||= SecureRandom::urlsafe_base64 
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password) 
  end


  def is_password?(password) #VERIFIED?
      self.password_digest == BCrypt::Password.create(password) #2a$10$175687215.87r16jfkahskjf14
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(params[:username])
    if user && is_password?(password)
        return user
    else
        return nil
    end
  end

  

end
