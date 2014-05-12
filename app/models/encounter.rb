class Encounter < ActiveRecord::Base
  include CampaignObjectHolder
  
  belongs_to :location
  has_many :encounter_opponents, inverse_of: :encounter
  has_many :opponents, source: :character, through: :encounter_opponents
  
  accepts_nested_attributes_for :encounter_opponents, allow_destroy: true
  validates :location, presence: true
end
