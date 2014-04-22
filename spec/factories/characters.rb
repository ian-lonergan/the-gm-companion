FactoryGirl.define do
  factory :character do
    campaign_object
    character_class "Dread Necromancer"
    race "Undead"
    level 17
    gender "Male"
  end
  
  factory :invalid_character do
    campaign_object nil
    character_class "Dread Necromancer"
    race "Undead"
    level 17
    gender "Male"
  end
end