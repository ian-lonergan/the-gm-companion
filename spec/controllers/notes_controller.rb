require 'spec_helper'

describe NotesController do
  it "gets the index" do
    note = FactoryGirl.create(:note)
    get :index
    response.should be_success
    expect(assigns(:notes)).to eq([note])
  end
end
