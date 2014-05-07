class Character < ActiveRecord::Base
  include CampaignObjectHolder
  
  belongs_to :location
  has_many :encounter_opponents
  has_many :encounters, through: :encounter_opponents
  has_many :character_classes
  
  accepts_nested_attributes_for :character_classes, allow_destroy: true
  
  def self.search(search_string)
    if search_string
      joins(:campaign_object).where('campaign_objects.name LIKE ?', "%#{search_string}%")
    else
      all
    end
  end
end
