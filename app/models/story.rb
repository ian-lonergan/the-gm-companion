class Story < ActiveRecord::Base
  include CampaignObjectHolder
  
  belongs_to :parent, class_name: "Story", foreign_key: "parent_id"
  has_many :children, class_name: "Story", foreign_key: "parent_id"
  
  def full_stories(n=3)
    {self => children.length > 0 && n > 0 ? children.map {|child| child.full_stories(n-1)} : nil}
  end
  
  belongs_to :location
end
