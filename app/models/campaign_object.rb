class CampaignObject < ActiveRecord::Base
  belongs_to :campaign_object_holder, polymorphic: true

  validates :name, presence: { message: "Please enter a name" }
  validates :abstract, presence: { message: "Please enter an abstract" }
end
