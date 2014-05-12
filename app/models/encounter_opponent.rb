class EncounterOpponent < ActiveRecord::Base
  belongs_to :encounter, inverse_of: :encounter_opponents
  belongs_to :character, inverse_of: :encounter_opponents
  delegate :name, to: :character, prefix: true
  
  validates :encounter, presence: true
  validates :character, presence: true
  validates :count, presence: true
end
