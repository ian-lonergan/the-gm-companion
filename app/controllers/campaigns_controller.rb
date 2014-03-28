class CampaignsController < ApplicationController
  def index
    choose_campaign(nil)
    @campaigns = Campaign.all
  end
  
  def new
    choose_campaign(nil)
    @campaign = Campaign.new
  end
  
  def create
    @campaign = Campaign.create(campaign_params)
    if @campaign.save
      choose_campaign(@campaign)
      redirect_to :action => :show, :id => @campaign
    else
      choose_campaign(nil)
    end
  end
  
  def show
    @campaign = Campaign.find(params[:id])
    if @campaign
      choose_campaign(@campaign)
    else
      choose_campaign(nil)
    end
  end
  
  def edit
    @campaign = Campaign.find(params[:id])
    if @campaign
      choose_campaign(@campaign)
    else
      choose_campaign(nil)
    end
  end
  
  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update_attributes(campaign_params)
      choose_campaign(@campaign)
      redirect_to :action => :show, :id => @campaign
    else
      choose_campaign(nil)
      redirect_to :action => :index
    end
  end
  
  def destroy
    @deleted = Campaign.find(params[:id]).destroy
    choose_campaign(nil)
    redirect_to :action => :index
  end
  
  def campaign_params
    params.require(:campaign).permit(:name, :description, :outline)
  end
  
end