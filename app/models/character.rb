class Character < ActiveRecord::Base
  has_one :campaign_object, as: :campaign_object_holder

  validates :campaign_object, presence: true
end
