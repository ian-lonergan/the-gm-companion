class CampaignObjectsController < ApplicationController
  
  def index
    @campaign_objects = CampaignObject.all
    @campaign_object = CampaignObject.first
  end
  
  def show
    @campaign_object = CampaignObject.find(params[:id])
  end
  
  def create
    @campaign_object = CampaignObject.create(params[:campaign_object])
  end
  
  def destroy
    @deleted = CampaignObject.find(params[:id]).destroy
    @campaign_object = CampaignObject.first
  end
  
end