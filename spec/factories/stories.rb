FactoryGirl.define do
  factory :story do
    campaign_object
    story_text "This is the text of the story."
  end
  
  factory :invalid_story do
    campaign_object nil
    story_text "This is the text of the story."
  end
end