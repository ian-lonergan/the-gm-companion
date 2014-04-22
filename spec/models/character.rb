require 'spec_helper'

describe Character do
  before(:each) do
    @character = FactoryGirl.build(:character, campaign_object: FactoryGirl.build(:campaign_object))
    @character.save
  end
  it "has a valid factory" do
    @character.should be_valid
  end
  it "is valid without a character class" do
    @character.character_class = nil
    @character.should be_valid
  end
  it "is valid without a race" do
    @character.race = nil
    @character.should be_valid
  end
  it "is valid without a level" do
    @character.level = nil
    @character.should be_valid
  end
  it "is valid without a gender" do
    @character.gender = nil
    @character.should be_valid
  end
  it "is invalid without a campaign object" do
    @character.campaign_object = nil
    @character.should_not be_valid
  end
end
