class CharactersController < ApplicationController
  
  def index
    @characters = Character.all
    @character = Character.includes(:campaign_object).first
  end
  
  def show
    @character = Character.includes(:campaign_object).find(params[:id])
  end
  
  def create
    @character = Character.create(params[:character])
  end
  
  def update
    @character
  end
  
  def destroy
    @deleted = Character.find(params[:id]).destroy
    @character = Character.includes(:campaign_object).first
  end
  
end