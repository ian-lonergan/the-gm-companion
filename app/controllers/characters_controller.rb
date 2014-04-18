class CharactersController < ApplicationController
  include CampaignObjectHolderController
  before_action :campaign_set
  before_action :logged_in_user, only: [:new, :create, :update, :edit, :destroy]
  before_action :correct_campaign_object_owner, only: [:update, :edit, :destroy]
  before_action :correct_campaign_owner, only: [:new, :create]

  def index
    characters = Campaign.find(params[:campaign_id]).characters
    if params[:search_query]
      @characters = characters.search(params[:search_query]).paginate(per_page: 10, page: params[:page])
    else
      @characters = characters.paginate(per_page: 5, page: params[:page])
    end
  end
  
  def new
    @campaign = Campaign.find(params[:campaign_id])
    @campaign_object = CampaignObject.new
    @character = Character.new
  end
  
  def create
    @character = Character.create(character_params)
    @character.campaign_object = CampaignObject.create(campaign_object_params)
    @character.campaign_object.campaign_id = params[:campaign_id]
    if @character.save
      redirect_to :action => :show, :id => @character
    else
      render :new
    end
  end
  
  def show
    @character = Character.includes(:campaign_object).find(params[:id])
  end
  
  def edit
    @character = Character.includes(:campaign_object).find(params[:id])
  end
  
  def update
    @character = Character.find(params[:id])
    @campaign_object = @character.campaign_object
    if @character.update_attributes(character_params) and @campaign_object.update_attributes(campaign_object_params)
      redirect_to :action => :show, :id => @character
    else
      redirect_to :action => :index
    end
  end
  
  def destroy
    @deleted = Character.find(params[:id]).destroy
    redirect_to :action => :index
  end
  
  def character_params
    params.require(:character).permit(:character_class, :race, :level, :gender, :description)
  end
  
end