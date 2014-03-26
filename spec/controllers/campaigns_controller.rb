require 'spec_helper'

describe CampaignsController do
  it "gets the index" do
    campaign = FactoryGirl.create(:campaign)
    get :index
    response.should be_success
    expect(assigns(:campaigns)).to eq([campaign])
  end
end
