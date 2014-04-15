class Encounter < ActiveRecord::Base
  include CampaignObjectHolder
  
  belongs_to :location
  has_many :encounters_characters
  has_many :opponents, class_name: "Character", through: :encounters_characters
  
  validates :location, presence: true
  validates :opponents, presence: true
  validates :count, presence: true
end
