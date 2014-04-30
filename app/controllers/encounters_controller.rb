class EncountersController < ApplicationController
  include CampaignObjectHolderController
  before_action :campaign_set_from_campaign_object, only: [:show, :edit, :update, :destroy]
  before_action :campaign_set_from_campaign_id, only: [:index, :create, :new]
  before_action :logged_in_user, only: [:new, :create, :update, :edit, :destroy]
  before_action :correct_campaign_object_owner, only: [:update, :edit, :destroy]
  before_action :correct_campaign_owner, only: [:new, :create]
  
  helper_method :sort_column

  def index
    @encounters = Campaign.find(params[:campaign_id]).encounters.includes(:campaign_object).order("campaign_objects." + sort_column + " asc").paginate(per_page: 10, page: params[:page])
  end
  
  def new
    @encounter = Encounter.new
    @encounter.build_campaign_object
    @encounter.campaign = Campaign.find(params[:campaign_id])
  end
  
  def create
    @encounter = Encounter.new(encounter_params)
    @encounter.campaign = Campaign.find(params[:campaign_id])
    if @encounter.save
      redirect_to :action => :show, :id => @encounter
    else
      render :new
    end
  end
  
  def show
    @encounter = Encounter.includes(:campaign_object).find(params[:id])
  end
  
  def edit
    @encounter = Encounter.includes(:campaign_object).find(params[:id])
  end
  
  def update
    @encounter = Encounter.find(params[:id])
    if @encounter.update_attributes(encounter_params)
      redirect_to :action => :show, :id => @encounter
    else
      render :edit
    end
  end
  
  def destroy
    Encounter.find(params[:id]).destroy
    redirect_to campaign_encounters_path(current_campaign)
  end
  
  def encounter_params
    params.require(:encounter).permit(:challenge_level, :location_id, campaign_object_attributes: campaign_object_attributes, encounter_opponents_attributes: encounter_opponents_attributes)
  end
  
  def encounter_opponents_attributes
    [:id, :character_id, :_destroy, :count]
  end
  
end
