class CampaignObject < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :campaign_object_holder, polymorphic: true, dependent: :delete
  has_many :notes
  has_one :owner, through: :campaign
  
  has_attached_file :picture, styles: { original: '600x600>', tiny:'75x75'}

  validates :name, presence: true
  validates :abstract, presence: true
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
