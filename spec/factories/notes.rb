FactoryGirl.define do
  factory :note do
    text 'The PCs entered town.'
    campaign_object
  end

  factory :invalid_note do
    text nil
    campaign_object nil
  end
end