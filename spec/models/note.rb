require 'spec_helper'

describe Note do
  before(:each) do
    campaign_object_holder = FactoryGirl.create(:character, campaign_object: FactoryGirl.build(:campaign_object))
    @note = FactoryGirl.create(:note, campaign_object: campaign_object_holder.campaign_object)
  end
  it "has a valid factory" do
    @note.should be_valid
  end
  it "is invalid without text" do
    @note.text = nil
    @note.should_not be_valid
  end
  it "is invalid without a campaign object" do
    @note.campaign_object = nil
    @note.should_not be_valid
  end
end
