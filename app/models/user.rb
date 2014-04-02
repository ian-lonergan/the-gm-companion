class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :username,  presence:   { message: "Please enter a name" },
                    format:     { with: /\A[a-zA-Z][a-zA-Z0-9_-]+\Z/ },
                    length:     { minimum: 3, maximum: 15 },
                    uniqueness: { case_sensitive: false }
  validates :email, presence:   { message: "Please enter an email" },
                    format:     { with: /\A.+@.+\..+\Z/ },
                    uniqueness: { case_sensitive: false }
  
  has_secure_password
  validates :password, length:  { minimum: 6 }
end
