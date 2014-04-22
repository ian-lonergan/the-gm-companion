require 'spec_helper'

describe CampaignObject do
  before(:each) do
    campaign_object_holder = FactoryGirl.build(:character, campaign_object: FactoryGirl.build(:campaign_object))
    campaign_object_holder.save
    @campaign_object = campaign_object_holder.campaign_object
  end
  it "has a valid factory" do
    @campaign_object.should be_valid
  end
  it "is invalid without a name" do
    @campaign_object.name = nil
    @campaign_object.should_not be_valid
  end
  it "is invalid without an abstract" do
    @campaign_object.abstract = nil
    @campaign_object.should_not be_valid
  end
  it "is valid without an object_text" do
    @campaign_object.object_text = nil
    @campaign_object.should be_valid
  end
  it "is invalid without a campaign" do
    @campaign_object.campaign = nil
    @campaign_object.should_not be_valid
  end
end
