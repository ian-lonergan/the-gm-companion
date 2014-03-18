class CampaignObjectsController < ApplicationController
  
  def index
    @campaign_objects = CampaignObject.all
  end
  
  def new
    @campaign_object = CampaignObject.new
  end
  
  def create
    @campaign_object = CampaignObject.create(campaign_object_params)
    @campaign_object.save
    redirect_to :action => :show, :id => @campaign_object
  end
  
  def show
    @campaign_object = CampaignObject.find(params[:id])
  end
  
  def edit
    @campaign_object = CampaignObject.find(params[:id])
  end
  
  def update
    @campaign_object = CampaignObject.find(params[:id])
    if @campaign_object.update_attributes(campaign_object_params)
      redirect_to :action => :show, :id => @campaign_object
    else
      redirect_to :action => :index
    end
  end
  
  def destroy
    @deleted = CampaignObject.find(params[:id]).destroy
    @campaign_object = CampaignObject.first
  end
  
  def campaign_object_params
    params.require(:campaign_object).permit(:name, :abstract, :notes)
  end
  
end