FactoryGirl.define do
  factory :location do
    campaign_object
    map File.new('spec/assets/images/test.png')
    map_key "This is am map key for the location's map."
  end
  
  factory :invalid_location do
    campaign_object nil
    map File.new('spec/assets/images/test.png')
    map_key "This is am map key for the location's map."
  end
end