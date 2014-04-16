module CampaignObjectHolder
  extend ActiveSupport::Concern
  
  included do
    has_one :campaign_object, as: :campaign_object_holder, dependent: :destroy
    has_one :owner, through: :campaign_object
    has_one :campaign, through: :campaign_object
    has_many :notes, through: :campaign_object
    delegate :name, :abstract, :picture, to: :campaign_object
    
    accepts_nested_attributes_for :campaign_object, update_only: true
    validates :campaign_object, presence: { message: "No campaign object detected" }
  end
end