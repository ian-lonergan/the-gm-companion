require 'spec_helper'

describe Campaign do
  it "has a valid factory" do
    FactoryGirl.create(:campaign).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:campaign, name: nil).should_not be_valid
  end
  it "is valid without a campaign_text" do
    FactoryGirl.build(:campaign, campaign_text: nil).should be_valid
  end
end
