class LocationsController < ApplicationController
  include CampaignObjectHolderController
  before_action :campaign_set_from_campaign_object, only: [:show, :edit, :update, :destroy]
  before_action :campaign_set_from_campaign_id, only: [:index, :create, :new]
  before_action :logged_in_user, only: [:new, :create, :update, :edit, :destroy]
  before_action :correct_campaign_object_owner, only: [:update, :edit, :destroy]
  before_action :correct_campaign_owner, only: [:new, :create]
  
  helper_method :sort_column
  
  def index
    @locations = Campaign.find(params[:campaign_id]).locations.includes(:campaign_object).order("campaign_objects." + sort_column + " asc").paginate(per_page: 10, page: params[:page])
  end
  
  def new
    @location = Location.new
    @location.build_campaign_object
    @location.campaign = Campaign.find(params[:campaign_id])
  end
  
  def create
    @location = Location.create(location_params)
    @location.campaign = Campaign.find(params[:campaign_id])
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
    if @location.update_attributes(location_params)
      redirect_to :action => :show, :id => @location
    else
      render :edit
    end
  end
  
  def destroy
    Location.find(params[:id]).destroy
    redirect_to campaign_locations_path(current_campaign)
  end
  
  def location_params
    params.require(:location).permit(:id, :name, :abstract, :campaign_id, :picture, :object_text, \
      :map, :map_key, :parent_id, campaign_object_attributes: campaign_object_attributes)
  end
  
end