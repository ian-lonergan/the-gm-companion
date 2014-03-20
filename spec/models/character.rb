require 'spec_helper'

describe Character do
  it "has a valid factory" do
    FactoryGirl.create(:character).should be_valid
  end
  it "is valid without a character class" do
    FactoryGirl.build(:character, character_class: nil).should be_valid
  end
  it "is valid without a race" do
    FactoryGirl.build(:character, race: nil).should be_valid
  end
  it "is valid without a level" do
    FactoryGirl.build(:character, level: nil).should be_valid
  end
  it "is valid without a gender" do
    FactoryGirl.build(:character, gender: nil).should be_valid
  end
  it "is valid without a description" do
    FactoryGirl.build(:character, description: nil).should be_valid
  end
  it "is invalid without a campaign object" do
    FactoryGirl.build(:character, campaign_object: nil).should_not be_valid
  end
end
