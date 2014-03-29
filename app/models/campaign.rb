class Campaign < ActiveRecord::Base
  has_many :campaign_objects
  has_many :characters, through: :campaign_objects, source: :campaign_object_holder, source_type: 'Character'
  has_many :locations, through: :campaign_objects, source: :campaign_object_holder, source_type: 'Location'
  has_many :stories, through: :campaign_objects, source: :campaign_object_holder, source_type: 'Story'

  validates :name, presence: { message: "Please enter a name" }
end
