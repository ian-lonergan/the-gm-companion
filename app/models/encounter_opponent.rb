class EncounterOpponent < ActiveRecord::Base
  belongs_to :encounter
  belongs_to :character
  delegate :name, to: :character, prefix: true
  
  validates :character, presence: true
  validates :count, presence: true
end
