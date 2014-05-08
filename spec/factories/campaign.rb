FactoryGirl.define do
  factory :campaign do
    association :owner, factory: :user
    name "Campaign name."
    campaign_text "This is the text of the campaign."
  end
  
  factory :invalid_campaign do
    association :owner, factory: :user
    name nil
    campaign_text "This is the text of the campaign."
  end
end