require 'spec_helper'

describe Story do
  it "has a valid factory" do
    FactoryGirl.create(:story).should be_valid
  end
  it "is invalid without a campaign object" do
    FactoryGirl.build(:story, campaign_object: nil).should_not be_valid
  end
  it "is valid without a story text" do
    FactoryGirl.build(:story, story_text: nil).should be_valid
  end
end
