class CampaignsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :update, :edit, :destroy]
  before_action :correct_user, only: [:update, :edit, :destroy]
  
  def index
    choose_campaign(nil)
    @campaigns = Campaign.paginate(per_page: 10, page: params[:page])
  end
  
  def new
    choose_campaign(nil)
    @campaign = Campaign.new
  end
  
  def create
    @campaign = current_user.campaigns.build(campaign_params)
    if @campaign.save
      choose_campaign(@campaign)
      redirect_to :action => :show, :id => @campaign
    else
      choose_campaign(nil)
      render :new
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
      render :edit
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
  
  private
    def correct_user
      @campaign = current_user.campaigns.find_by(id: params[:id])
      redirect_to root_url if @campaign.nil?
    end
end