class EncountersController < ApplicationController
  include CampaignObjectHolderController
  before_action :logged_in_user, only: [:new, :create, :update, :edit, :destroy]
  before_action :correct_user, only: [:new, :create, :update, :edit, :destroy]

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
    @encounter.campaign = Campaign.find(params[:campaign_id])
  end
  
  def create
    @encounter = Encounter.new(encounter_params)
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
    params.require(:encounter).permit(:challenge_level, :location_id, :loot, :description, campaign_object_attributes: campaign_object_attributes)
  end
  
end
