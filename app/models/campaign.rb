class Campaign < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  
  has_many :campaign_objects
  has_many :characters, through: :campaign_objects, source: :campaign_object_holder, source_type: 'Character'
  has_many :locations, through: :campaign_objects, source: :campaign_object_holder, source_type: 'Location'
  has_many :stories, through: :campaign_objects, source: :campaign_object_holder, source_type: 'Story'
  has_many :encounters, through: :campaign_objects, source: :campaign_object_holder, source_type: 'Encounter'
  has_many :organizations, through: :campaign_objects, source: :campaign_object_holder, source_type: 'Organization'
  
  has_many :notes, through: :campaign_objects
  
  has_many :starred
  has_many :starred_by, through: :starred, source: :user

  validates :name, presence: true
  validates :owner, presence: true
end
