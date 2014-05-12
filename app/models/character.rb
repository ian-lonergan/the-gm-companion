class Character < ActiveRecord::Base
  include CampaignObjectHolder
  
  belongs_to :location
  has_many :encounter_opponents, inverse_of: :character
  has_many :encounters, through: :encounter_opponents
  has_many :organization_members, inverse_of: :character
  has_many :organizations, through: :organization_members
  has_many :character_classes, inverse_of: :character
  
  accepts_nested_attributes_for :character_classes, allow_destroy: true
  
  def self.search(search_string)
    if search_string
      joins(:campaign_object).where('campaign_objects.name LIKE ?', "%#{search_string}%")
    else
      all
    end
  end
end
