FactoryGirl.define do
  factory :character do
    race "Undead"
    gender "Male"
    
    after(:create) do |character, e|
      create_list(:character_class, 2, character: character)
    end
  end
  
  factory :invalid_character do
    race "Undead"
    gender "Male"
  end
end