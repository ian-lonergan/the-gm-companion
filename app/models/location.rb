class Location < ActiveRecord::Base
  include CampaignObjectHolder
  
  belongs_to :parent, class_name: "Location", foreign_key: "parent_id"
  has_many :children, class_name: "Location", foreign_key: "parent_id"
  delegate :id, to: :parent, prefix: true, allow_nil: true
  
  has_many :stories
  has_many :characters
  has_many :encounters, through: :locations
  
  has_attached_file :map, styles: { original: '600x600>', medium: '300x300'}
  
  def full_locations(n=3)
    {self => children.length > 0 && n > 0 ? children.map {|child| child.full_locations(n-1)} : nil}
  end
  
  validates_attachment_content_type :map, content_type: /\Aimage\/.*\Z/
end
