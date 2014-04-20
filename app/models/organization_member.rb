class OrganizationMember < ActiveRecord::Base
  belongs_to :organization
  belongs_to :character
  delegate :name, to: :character, prefix: true
  
  validates :character, presence: true
end
