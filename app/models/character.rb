class Character < ActiveRecord::Base
  include CampaignObjectHolder
  
  def self.search(search_string)
    if search_string
      joins(:campaign_object).where('campaign_objects.name LIKE ?', "%#{search_string}%")
    else
      all.load
    end
  end
end
