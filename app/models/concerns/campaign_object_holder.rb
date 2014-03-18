module CampaignObjectHolder
  extend ActiveSupport::Concern
  
  included do
    has_one :campaign_object, as: :campaign_object_holder
    
    def name
      campaign_object.name
    end
    
    def abstract
      campaign_object.abstract
    end
    
    def notes
      campaign_object.notes
    end
    
    accepts_nested_attributes_for :campaign_object
    validates :campaign_object, presence: { message: "No campaign object detected" }
  end
end