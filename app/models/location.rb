class Location < ActiveRecord::Base
  include CampaignObjectHolder
  
  has_many :encounters, through: :locations
  has_attached_file :map, styles: { original: '600x600>', medium: '300x300'}
  
  validates_attachment_content_type :map, content_type: /\Aimage\/.*\Z/
end
