class User < ActiveRecord::Base
  has_many :campaigns, foreign_key: :owner_id
  has_many :campaign_objects, through: :campaigns
  has_many :notes, through: :campaign_objects
  has_one :invitation
  
  before_create :create_remember_token
  
  validates :username,    presence:   true,
                          format:     { with: /\A[a-zA-Z][a-zA-Z0-9_-]+\Z/ },
                          length:     { minimum: 3, maximum: 15 },
                          uniqueness: { case_sensitive: false }
  validates :email,       presence:   true,
                          format:     { with: /\A.+@.+\..+\Z/ },
                          uniqueness: { case_sensitive: false }
  validates :invitation,  presence:   { message: "must have a valid invite key" }
  
  has_secure_password
  validates :password,    length:     { minimum: 6 },
                          format:     { with: /\A(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).+\Z/,
                                        message: "must contain at least one upper case letter, one lower case letter, and one digit " }
  
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
