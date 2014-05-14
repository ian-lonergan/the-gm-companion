class Star < ActiveRecord::Base
  belongs_to :user
  belongs_to :starred_item, polymorphic: true
  
  validates :user, presence: true
  validates :starred_item, presence: true
end
