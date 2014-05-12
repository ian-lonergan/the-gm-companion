class CharacterClass < ActiveRecord::Base
  belongs_to :character, inverse_of: :character_classes
  
  validates :character, presence: true
end
