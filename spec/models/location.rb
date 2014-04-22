require 'spec_helper'

describe Location do
  before(:each) do
    @location = FactoryGirl.build(:location, campaign_object: FactoryGirl.build(:campaign_object))
    @location.save
  end
  it "has a valid factory" do
    @location.should be_valid
  end
  it "is valid without a map" do
    @location.map = nil
    @location.should be_valid
  end
  it "is valid without a map key" do
    @location.map_key = nil
    @location.should be_valid
  end
  it "is invalid without a campaign object" do
    @location.campaign_object = nil
    @location.should_not be_valid
  end
end
