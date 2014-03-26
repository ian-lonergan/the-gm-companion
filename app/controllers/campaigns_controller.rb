class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
  end
  
  def new
    @campaign = Campaign.new
  end
  
  def create
    @campaign = Campaign.create(campaign_params)
    @campaign.save
    redirect_to :action => :show, :id => @campaign
  end
  
  def show
    @campaign = Campaign.find(params[:id])
  end
  
  def edit
    @campaign = Campaign.find(params[:id])
  end
  
  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update_attributes(campaign_params)
      redirect_to :action => :show, :id => @campaign
    else
      redirect_to :action => :index
    end
  end
  
  def destroy
    @deleted = Campaign.find(params[:id]).destroy
    redirect_to :action => :index
  end
  
  def campaign_params
    params.require(:campaign).permit(:name, :summary, :description)
  end
  
end