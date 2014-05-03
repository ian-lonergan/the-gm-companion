class CharactersController < ApplicationController
  include CampaignObjectHolderController
  before_action only: [:show, :edit, :update, :destroy] do
    campaign_set_from_campaign_object(Character)
  end
  before_action :campaign_set_from_campaign_id, only: [:index, :create, :new]
  before_action :logged_in_user, only: [:new, :create, :update, :edit, :destroy]
  before_action only: [:update, :edit, :destroy] do
    correct_campaign_object_owner(Character)
  end
  before_action :correct_campaign_owner, only: [:new, :create]
  
  helper_method :sort_column

  def index
    @characters = Campaign.find(params[:campaign_id]).characters.order(sort_column + " asc").paginate(per_page: 10, page: params[:page])
  end
  
  def new
    @character = Character.new
    @character.campaign = Campaign.find(params[:campaign_id])
  end
  
  def create
    @character = Character.create(character_params)
    @character.campaign = Campaign.find(params[:campaign_id])
    if @character.save
      redirect_to :action => :show, :id => @character
    else
      render :new
    end
  end
  
  def show
    @character = Character.find(params[:id])
  end
  
  def edit
    @character = Character.find(params[:id])
  end
  
  def update
    @character = Character.find(params[:id])
    if @character.update_attributes(character_params)
      redirect_to :action => :show, :id => @character
    else
      render :edit
    end
  end
  
  def destroy
    Character.find(params[:id]).destroy
    redirect_to campaign_characters_path(current_campaign)
  end
  
  def character_params
    params.require(:character).permit(:id, :name, :abstract, :campaign_id, :picture, :object_text, \
      :character_class, :race, :level, :gender, :status, :alignment, :location_id)
  end
  
  private
    def sort_column
      Location.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end
  
end