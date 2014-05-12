class Organization < ActiveRecord::Base
  include CampaignObjectHolder
  
  has_many :organization_members, inverse_of: :organization
  has_many :members, source: :character, through: :organization_members
  
  accepts_nested_attributes_for :organization_members, allow_destroy: true
end
