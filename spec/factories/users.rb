FactoryGirl.define do
  factory :user do
    username 'iploner'
    email 'iploner@example.com'
    password 'password'
    password_confirmation 'password'
  end

  factory :invalid_user do
    username nil
    email 'iploner@example.com'
    password 'password'
    password_confirmation 'password'
  end
end