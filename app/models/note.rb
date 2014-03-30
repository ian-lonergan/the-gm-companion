class Note < ActiveRecord::Base
  belongs_to :campaign_object
  
  validates :campaign_object, presence: { message: "Notes need a campaign object." }
  validates :text, presence: { message: "Please enter the text." }
end
