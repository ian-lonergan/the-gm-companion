class LocationsController < ApplicationController
  include CampaignObjectHolderController

  def index
    @locations = Location.all
  end
  
  def new
    @campaign_object = CampaignObject.new
    @location = Location.new
  end
  
  def create
    @location = Location.create(location_params)
    @location.campaign_object = CampaignObject.create(campaign_object_params)
    @location.save
    redirect_to :action => :show, :id => @location
  end
  
  def show
    @location = Location.includes(:campaign_object).find(params[:id])
  end
  
  def edit
    @location = Location.includes(:campaign_object).find(params[:id])
  end
  
  def update
    @location = Location.find(params[:id])
    @campaign_object = @location.campaign_object
    if @location.update_attributes(location_params) and @campaign_object.update_attributes(campaign_object_params)
      redirect_to :action => :show, :id => @location
    else
      redirect_to :action => :index
    end
  end
  
  def destroy
    @deleted = Location.find(params[:id]).destroy
    redirect_to :action => :index
  end
  
  def location_params
    params.require(:location).permit(:map, :map_key)
  end
  
end
