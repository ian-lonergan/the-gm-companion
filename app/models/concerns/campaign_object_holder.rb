module CampaignObjectHolder
  extend ActiveSupport::Concern
  
  included do
    belongs_to :campaign
    has_many :notes, as: :campaign_object
    has_one :owner, through: :campaign
    
    has_attached_file :picture, styles: { original: '600x600>', tiny:'75x75'}
    
    scope :by_campaign, ->(campaign_id) { where(campaign_id: campaign_id) }
    
    validates :name, presence: true
    validates :abstract, presence: true
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
    validates :campaign, presence: true
  end
end