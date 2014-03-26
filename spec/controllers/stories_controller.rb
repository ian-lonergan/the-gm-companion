require 'spec_helper'

describe StoriesController do
  it "gets the index" do
    story = FactoryGirl.create(:story)
    get :index
    response.should be_success
    expect(assigns(:stories)).to eq([story])
  end
end
