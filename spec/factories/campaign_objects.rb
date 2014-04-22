FactoryGirl.define do
  factory :campaign_object do
    name 'Jowan'
    abstract 'An important but mysterious necromancer.'
    object_text 'This is the object text of a campaign_object.'
    campaign
  end

  factory :invalid_campaign_object do
    name nil
    abstract 'This shouldn\'t exist'
    object_text 'This is the object text of a campaign_object.'
    campaign
  end
end