require 'spec_helper'

describe Story do
  before(:each) do
    @story = FactoryGirl.build(:story, campaign_object: FactoryGirl.build(:campaign_object))
    @story.save
  end
  it "has a valid factory" do
    @story.should be_valid
  end
  it "is invalid without a campaign object" do
    @story.campaign_object = nil
    @story.should_not be_valid
  end
end
