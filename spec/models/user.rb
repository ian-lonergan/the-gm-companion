require 'spec_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end
  it "is invalid without a username" do
    FactoryGirl.build(:user, username: nil).should_not be_valid
  end
  it "is invalid with a short username" do
    FactoryGirl.build(:user, username: "ab").should_not be_valid
  end
  it "is invalid without an email" do
    FactoryGirl.build(:user, email: nil).should_not be_valid
  end
  it "is invalid with an invalid email" do
    FactoryGirl.build(:user, email: "bad.email").should_not be_valid
  end
  it "is invalid without a password" do
    FactoryGirl.build(:user, password: nil).should_not be_valid
  end
  it "is invalid when the password is too short" do
    FactoryGirl.build(:user, password: "pass", password_confirmation: "pass").should_not be_valid
  end
  it "is invalid without a password confirmation" do
    FactoryGirl.build(:user, password_confirmation: nil).should_not be_valid
  end
  it "is invalid when the password does not match the password confirmation" do
    FactoryGirl.build(:user, password: "password", password_confirmation: "not password").should_not be_valid
  end
  it "disallows repeated usernames" do
    invitation = FactoryGirl.create(:invitation, key: "NewKey")
    FactoryGirl.create(:user, username: "duplicate", email: "unique@test.com")
    FactoryGirl.build(:user, username: "duplicate", email: "other@test.com", invitation: invitation).should_not be_valid
  end
  it "disallows repeated emails" do
    invitation = FactoryGirl.create(:invitation, key: "NewKey")
    FactoryGirl.create(:user, username: "unique", email: "duplicate@test.com")
    FactoryGirl.build(:user, username: "other", email: "duplicate@test.com", invitation: invitation).should_not be_valid
  end
  it "authenticates with the valid password" do
    user = FactoryGirl.create(:user)
    found_user = User.find_by(username: user.username)
    expect(user).to eq found_user.authenticate(user.password)
  end
  it "fails to authenticate with the invalid password" do
    user = FactoryGirl.create(:user, password: "Password1", password_confirmation: "Password1")
    found_user = User.find_by(username: user.username)
    expect(user).to_not eq found_user.authenticate("invalid-password")
  end
end
