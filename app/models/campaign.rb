class Campaign < ActiveRecord::Base
  has_many :campaign_objects

  validates :name, presence: { message: "Please enter a name" }
end
