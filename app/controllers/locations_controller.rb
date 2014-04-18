class LocationsController < ApplicationController
  include CampaignObjectHolderController
  before_action :campaign_set
  before_action :logged_in_user, only: [:new, :create, :update, :edit, :destroy]
  before_action :correct_campaign_object_owner, only: [:update, :edit, :destroy]
  before_action :correct_campaign_owner, only: [:new, :create]

  def index
    @locations = Campaign.find(params[:campaign_id]).locations.paginate(per_page: 10, page: params[:page])
  end
  
  def new
    @campaign = Campaign.find(params[:campaign_id])
    @campaign_object = CampaignObject.new
    @location = Location.new
  end
  
  def create
    @location = Location.create(location_params)
    @location.campaign_object = CampaignObject.create(campaign_object_params)
    @location.campaign_object.campaign_id = params[:campaign_id]
    if @location.save
      redirect_to :action => :show, :id => @location
    else
      render :new
    end
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
    Location.find(params[:id]).destroy
    redirect_to campaign_locations_path(current_campaign)
  end
  
  def location_params
    params.require(:location).permit(:map, :map_key)
  end
  
end
