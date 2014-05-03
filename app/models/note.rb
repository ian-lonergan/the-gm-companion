class Note < ActiveRecord::Base
  belongs_to :campaign_object, polymorphic: true
  has_one :campaign, through: :campaign_object
  
  validates :campaign_object, presence: true
  validates :text, presence: true
end
