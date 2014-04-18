class EncountersController < ApplicationController
  include CampaignObjectHolderController
  before_action :campaign_set
  before_action :logged_in_user, only: [:new, :create, :update, :edit, :destroy]
  before_action :correct_campaign_object_owner, only: [:update, :edit, :destroy]
  before_action :correct_campaign_owner, only: [:new, :create]

  def index
    if params[:campaign_id]
      @encounters = Campaign.find(params[:campaign_id]).encounters
    else
      @encounters = Encounter.all
    end
  end
  
  def new
    @encounter = Encounter.new
    @encounter.build_campaign_object
    @encounter.encounter_opponents.build
    @encounter.campaign = Campaign.find(params[:campaign_id])
  end
  
  def create
    debugger
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
    @deleted = Encounter.find(params[:id]).destroy
    redirect_to :action => :index
  end
  
  def encounter_params
    params.require(:encounter).permit(:challenge_level, :location_id, :loot, :description, campaign_object_attributes: campaign_object_attributes, encounter_opponents_attributes: encounter_opponents_attributes)
  end
  
  def encounter_opponents_attributes
    [:id, :character_id, :_destroy, :count]
  end
  
end
