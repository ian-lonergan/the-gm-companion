class StoriesController < ApplicationController
  include CampaignObjectHolderController
  before_action :campaign_set
  before_action :logged_in_user, only: [:new, :create, :update, :edit, :destroy]
  before_action :correct_campaign_object_owner, only: [:update, :edit, :destroy]
  before_action :correct_campaign_owner, only: [:new, :create]
  
  def index
    @stories = Campaign.find(params[:campaign_id]).stories.paginate(per_page: 10, page: params[:page])
  end
  
  def new
    @campaign = Campaign.find(params[:campaign_id])
    @campaign_object = CampaignObject.new
    @story = Story.new
  end
  
  def create
    @story = Story.create(story_params)
    @story.campaign_object = CampaignObject.create(campaign_object_params)
    @story.campaign_object.campaign_id = params[:campaign_id]
    if @story.save
      redirect_to :action => :show, :id => @story
    else
      render :new
    end
  end
  
  def show
    @story = Story.includes(:campaign_object).find(params[:id])
  end
  
  def edit
    @story = Story.includes(:campaign_object).find(params[:id])
  end
  
  def update
    @story = Story.find(params[:id])
    @campaign_object = @story.campaign_object
    if @story.update_attributes(story_params) and @campaign_object.update_attributes(campaign_object_params)
      redirect_to :action => :show, :id => @story
    else
      redirect_to :action => :index
    end
  end
  
  def destroy
    Story.find(params[:id]).destroy
    redirect_to campaign_stories_path(current_campaign)
  end
  
  def story_params
    params.require(:story).permit(:story_text)
  end
  
end
