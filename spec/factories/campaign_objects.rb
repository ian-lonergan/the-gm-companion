FactoryGirl.define do
  factory :campaign_object do
    name 'Jowan'
    abstract 'An important but mysterious necromancer.'
    notes 'He\'s important to the plot.'
  end

  factory :invalid_campaign_object do
    name nil
    abstract 'This shouldn\'t exist'
  end
end