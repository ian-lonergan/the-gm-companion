require 'spec_helper'

describe CampaignObject do
  it "has a valid factory" do
    FactoryGirl.create(:campaign_object).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:campaign_object, name: nil).should_not be_valid
  end
  it "is invalid without an abstract" do
    FactoryGirl.build(:campaign_object, abstract: nil).should_not be_valid
  end
  it "is valid without notes" do
    FactoryGirl.build(:campaign_object, notes: nil).should be_valid
  end
end
