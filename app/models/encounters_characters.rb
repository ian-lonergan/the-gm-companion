class EncountersCharacters < ActiveRecord::Base
  belongs_to :encounter
  belongs_to :character
  
  validates :encounter, presence: true
  validates :character, presence: true
  validates :count, presence: true
end
