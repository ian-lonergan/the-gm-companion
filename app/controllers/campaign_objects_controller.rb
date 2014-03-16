class CampaignObjectsController < ApplicationController
  
  def index
    @campaign_objects = CampaignObject.all
    @campaign_object = CampaignObject.first
  end
  
  def show
    @campaign_object = CampaignObject.find(params[:id])
  end
  
  def create
    @campaign_object = CampaignObject.create(name: params[:name], abstract: params[:abstract], notes: params[:notes])
  end
  
  def destroy
    
  end
  
end