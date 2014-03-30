require 'spec_helper'

describe Note do
  it "has a valid factory" do
    FactoryGirl.create(:note).should be_valid
  end
  it "is invalid without text" do
    FactoryGirl.build(:note, text: nil).should_not be_valid
  end
  it "is invalid without a campaign object" do
    FactoryGirl.build(:note, campaign_object: nil).should_not be_valid
  end
end
