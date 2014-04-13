class CampaignObjectsController < ApplicationController
  before_action :logged_in_user, only: [:create, :update, :edit, :destroy]
  before_action :correct_user, only: [:create, :update, :edit, :destroy]
  
  def index
    @campaign_objects = CampaignObject.all
  end
  
  def create
    @campaign_object = current_campaign.campaign_objects.build(campaign_object_params)
    if @campaign_object.save
      redirect_to :action => :show, :id => @campaign_object
    else
      render :new
    end
  end
    
  def update
    @campaign_object = CampaignObject.find(params[:id])
    if @campaign_object.update_attributes(campaign_object_params)
      redirect_to :action => :show, :id => @campaign_object
    else
      redirect_to :action => :index
    end
  end
  
  def destroy
    @deleted = CampaignObject.find(params[:id]).destroy
    redirect_to :action => :index
  end
  
  def campaign_object_params
    params.require(:campaign_object).permit(:name, :abstract, :picture)
  end
  
end