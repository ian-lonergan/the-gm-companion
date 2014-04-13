class Campaign < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  
  has_many :campaign_objects
  has_many :characters, through: :campaign_objects, source: :campaign_object_holder, source_type: 'Character'
  has_many :locations, through: :campaign_objects, source: :campaign_object_holder, source_type: 'Location'
  has_many :stories, through: :campaign_objects, source: :campaign_object_holder, source_type: 'Story'
  has_many :notes, through: :campaign_objects

  validates :name, presence: true
  validates :owner, presence: true
end
