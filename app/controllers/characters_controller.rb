class CharactersController < ApplicationController
  
  def index
    @characters = Character.all
    @character = Character.includes(:campaign_object).first
  end
  
  def new
    @character = Character.new
  end
  
  def create
    @character = Character.create(params[:character])
    @character.save
  end
  
  def show
    @character = Character.includes(:campaign_object).find(params[:id])
  end
  
  def edit
    @character = Character.find(params[:id])
  end
  
  def update
    @character = Character.find(params[:id])
    if @character.update_attributes(character_params)
      redirect_to :action => :show, :id => @character
    else
      redirect_to :action => :index
    end
  end
  
  def destroy
    @deleted = Character.find(params[:id]).destroy
    @character = Character.includes(:campaign_object).first
  end
  
  def character_params
    params.require(:character).permit(:character_class, :race, :level, :gender, :description)
  end
  
end