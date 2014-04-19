class CampaignObject < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :campaign_object_holder, polymorphic: true, dependent: :delete
  has_many :notes
  has_one :owner, through: :campaign
  
  has_attached_file :picture, styles: { original: '600x600>', tiny:'75x75'}
  
  before_save :check_campaign_object_holder
  
  scope :by_type,     ->(type)        { where(campaign_object_holder_type: type) }
  scope :by_campaign, ->(campaign_id) { where(campaign_id: campaign_id) }
  
  def check_campaign_object_holder
    if campaign_object_holder.nil?
      false
    end
  end

  validates :name, presence: true
  validates :abstract, presence: true
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  validates :campaign, presence: true
end
