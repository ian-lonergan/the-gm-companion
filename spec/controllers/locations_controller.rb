require 'spec_helper'

describe LocationsController do
  it "gets the index" do
    location = FactoryGirl.create(:location)
    get :index
    response.should be_success
    expect(assigns(:locations)).to eq([location])
  end
end
