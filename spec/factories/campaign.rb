FactoryGirl.define do
  factory :campaign do
    name "Campaign name."
    description "This is the description of the story."
    outline "This is the outline of the story."
  end
  
  factory :invalid_campaign do
    name nil
    description "This is the description of the story."
    outline "This is the outline of the story."
  end
end