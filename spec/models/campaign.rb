require 'spec_helper'

describe Campaign do
  it "has a valid factory" do
    FactoryGirl.create(:campaign).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:campaign, name: nil).should_not be_valid
  end
  it "is valid without a description" do
    FactoryGirl.build(:campaign, description: nil).should be_valid
  end
  it "is valid without a outline" do
    FactoryGirl.build(:campaign, outline: nil).should be_valid
  end
end
