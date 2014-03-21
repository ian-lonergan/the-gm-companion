require 'spec_helper'

describe Location do
  it "has a valid factory" do
    FactoryGirl.create(:location).should be_valid
  end
  it "is valid without a map" do
    FactoryGirl.build(:location, map: nil).should be_valid
  end
  it "is valid without a map key" do
    FactoryGirl.build(:location, map_key: nil).should be_valid
  end
  it "is invalid without a campaign object" do
    FactoryGirl.build(:location, campaign_object: nil).should_not be_valid
  end
end
