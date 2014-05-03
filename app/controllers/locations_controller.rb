class LocationsController < ApplicationController
  include CampaignObjectHolderController
  before_action :campaign_set_from_campaign_object, only: [:show, :edit, :update, :destroy]
  before_action :campaign_set_from_campaign_id, only: [:index, :create, :new]
  before_action :logged_in_user, only: [:new, :create, :update, :edit, :destroy]
  before_action :correct_campaign_object_owner, only: [:update, :edit, :destroy]
  before_action :correct_campaign_owner, only: [:new, :create]
  
  helper_method :sort_join_column
  
  def index
    join, column = sort_join_column
    join_table_name = join
    join_table_name = join_table_name.values.last while join_table_name.kind_of?(Hash)
    debugger
    if join
      @locations = Campaign.find(params[:campaign_id]).locations.joins(join).order(join_table_name.to_s.pluralize + "." + column + " asc").paginate(per_page: 10, page: params[:page])
    else
      @locations = Campaign.find(params[:campaign_id]).locations.order(column + " asc").paginate(per_page: 10, page: params[:page])
    end
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
    params.require(:location).permit(:map, :map_key, :parent_id, campaign_object_attributes: campaign_object_attributes)
  end
  
  private
    def sort_join_column
      join = params[:join]
      join = join.values.last while join.kind_of?(Hash)
      model = join ? join.classify.constantize : Location
      model.column_names.include?(params[:sort]) ? [fully_symbolize(params[:join]), params[:sort]] : [:campaign_object, "created_at"]
    end
end