class Story < ActiveRecord::Base
  include CampaignObjectHolder
  
  belongs_to :parent, class_name: "Story", foreign_key: "parent_id"
  has_many :children, class_name: "Story", foreign_key: "parent_id"
  
  belongs_to :location
end
