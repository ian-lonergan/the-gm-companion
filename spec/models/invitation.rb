require 'spec_helper'

describe Invitation do
  it "has a valid factory" do
    FactoryGirl.create(:invitation).should be_valid
  end
  it "is invalid without a key" do
    FactoryGirl.build(:invitation, key: nil).should_not be_valid
  end
end
