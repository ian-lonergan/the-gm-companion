class OrganizationMember < ActiveRecord::Base
  belongs_to :organization, inverse_of: :organization_members
  belongs_to :character, inverse_of: :organization_members
  delegate :name, to: :character, prefix: true
  
  validates :character, presence: true
end
