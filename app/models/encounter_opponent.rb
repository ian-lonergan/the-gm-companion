class EncounterOpponent < ActiveRecord::Base
  belongs_to :encounter
  belongs_to :character
  
  validates :character, presence: true
  validates :count, presence: true
end
