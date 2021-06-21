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
end
