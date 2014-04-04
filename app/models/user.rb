class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :username,  presence:   true,
                    format:     { with: /\A[a-zA-Z][a-zA-Z0-9_-]+\Z/ },
                    length:     { minimum: 3, maximum: 15 },
                    uniqueness: { case_sensitive: false }
  validates :email, presence:   true,
                    format:     { with: /\A.+@.+\..+\Z/ },
                    uniqueness: { case_sensitive: false }
  
  has_secure_password
  validates :password, length:  { minimum: 6 }
end
