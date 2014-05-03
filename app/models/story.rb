class Story < ActiveRecord::Base
  include CampaignObjectHolder
  
  belongs_to :location
end
