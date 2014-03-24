require 'spec_helper'

describe CampaignObjectsController do
  it "gets the index" do
    campaign_object = FactoryGirl.create(:campaign_object)
    get :index
    response.should be_success
    expect(assigns(:campaign_objects)).to eq([campaign_object])
  end
end
