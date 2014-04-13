class Invitation < ActiveRecord::Base
  belongs_to :user
  
  validates_uniqueness_of :key
  validates_presence_of   :key
end
