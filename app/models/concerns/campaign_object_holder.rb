module CampaignObjectHolder
  extend ActiveSupport::Concern
  
  included do
    has_one :campaign_object, as: :campaign_object_holder, dependent: :destroy
    has_one :owner, through: :campaign_object
    has_one :campaign, through: :campaign_object
    has_many :starred_by, through: :campaign_object
    has_many :notes, through: :campaign_object
    delegate :name, :abstract, :picture, :object_text, to: :campaign_object
    
    def is_starred(current_user)
      starred_by.find_by(id: current_user.id).nil? ? false : true
    end
    
    accepts_nested_attributes_for :campaign_object, update_only: true
    validates :campaign_object, presence: true
  end
end