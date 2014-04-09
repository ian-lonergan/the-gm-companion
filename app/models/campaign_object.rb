class CampaignObject < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :campaign_object_holder, polymorphic: true, dependent: :delete
  has_many :notes
  has_one :owner, through: :campaign

  validates :name, presence: true
  validates :abstract, presence: true
end
