FactoryGirl.define do
  factory :user do
    username 'iploner'
    email 'iploner@example.com'
    password 'Password1'
    password_confirmation 'Password1'
    invitation
  end

  factory :invalid_user do
    username nil
    email 'iploner@example.com'
    password 'Password1'
    password_confirmation 'Password1'
    invitation
  end
end