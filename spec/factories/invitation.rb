FactoryGirl.define do
  factory :invitation do
    key SecureRandom.base64(6)
    user nil
  end
end