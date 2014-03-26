require 'spec_helper'

describe CharactersController do
  it "gets the index" do
    character = FactoryGirl.create(:character)
    get :index
    response.should be_success
    expect(assigns(:characters)).to eq([character])
  end
end
