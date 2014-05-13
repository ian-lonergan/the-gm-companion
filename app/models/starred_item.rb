class Starred < ActiveRecord::Base
  belongs_to :user
  belongs_to :starred_item, polymorphic: true
  
  validates :user, presence: true
  validates :starred, presence: true
end
