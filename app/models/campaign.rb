class Campaign < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  
  has_many :characters
  has_many :locations
  has_many :stories
  has_many :encounters
  has_many :organizations

  def notes
    Note.joins(campaign_object: :owner).where("owner.id = #{self.id}")
  end

  validates :name, presence: true
  validates :owner, presence: true
end
