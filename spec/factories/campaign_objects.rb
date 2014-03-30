FactoryGirl.define do
  factory :campaign_object do
    name 'Jowan'
    abstract 'An important but mysterious necromancer.'
    campaign
  end

  factory :invalid_campaign_object do
    name nil
    abstract 'This shouldn\'t exist'
    campaign
  end
end