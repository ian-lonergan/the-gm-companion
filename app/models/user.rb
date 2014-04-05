class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :username,  presence:   true,
                    format:     { with: /\A[a-zA-Z][a-zA-Z0-9_-]+\Z/ },
                    length:     { minimum: 3, maximum: 15 },
                    uniqueness: { case_sensitive: false }
  validates :email, presence:   true,
                    format:     { with: /\A.+@.+\..+\Z/ },
                    uniqueness: { case_sensitive: false }
  
  has_secure_password
  validates :password, length:  { minimum: 6 }
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  private
    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end
end
