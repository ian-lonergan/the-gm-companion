FactoryGirl.define do
  factory :story do
  end
  
  factory :invalid_story do
    campaign_object nil
  end
end