class Location < ActiveRecord::Base
  include CampaignObjectHolder
  
  belongs_to :parent, class_name: "Location", foreign_key: "parent_id"
  has_many :children, class_name: "Location", foreign_key: "parent_id"
  
  has_many :characters
  
  has_many :encounters, through: :locations
  
  delegate :id, to: :parent, prefix: true, allow_nil: true
  
  has_attached_file :map, styles: { original: '600x600>', medium: '300x300'}
  
  validates_attachment_content_type :map, content_type: /\Aimage\/.*\Z/
end
