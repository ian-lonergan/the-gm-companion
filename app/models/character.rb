class Character < ActiveRecord::Base
  include CampaignObjectHolder
  
  belongs_to :location
  has_many :encounter_opponents
  has_many :encounters, through: :encounter_opponents
  
  def self.search(search_string)
    if search_string
      joins(:campaign_object).where('campaign_objects.name LIKE ?', "%#{search_string}%")
    else
      all
    end
  end
end
