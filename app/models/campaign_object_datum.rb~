class CampaignObject < ActiveRecord::Base
  belongs_to :campaign_object_holder, polymorphic: true

  validates :name, presence: true
  validates :abstract, presence: true
end
