class StoriesController < ApplicationController
  include CampaignObjectHolderController
  before_action :campaign_set_from_campaign_object, only: [:show, :edit, :update, :destroy]
  before_action :campaign_set_from_campaign_id, only: [:index, :create, :new]
  before_action :logged_in_user, only: [:new, :create, :update, :edit, :destroy]
  before_action :correct_campaign_object_owner, only: [:update, :edit, :destroy]
  before_action :correct_campaign_owner, only: [:new, :create]
  
  helper_method :sort_column
  
  def index
    @stories = Campaign.find(params[:campaign_id]).campaign_objects.by_type("Story").order(sort_column).paginate(per_page: 25, page: params[:page])
  end
  
  def tags
    @stories = Campaign.find(params[:campaign_id]).campaign_objects.by_type("Story").tagged_with(params[:tag]).order(sort_column).paginate(per_page: 25, page: params[:page])
    render :index
  end
  
  def new
    @story = Story.new
    @story.build_campaign_object
    @story.campaign = Campaign.find(params[:campaign_id])
  end
  
  def create
    @story = Story.create(story_params)
    @story.campaign = Campaign.find(params[:campaign_id])
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
    if @story.update_attributes(story_params)
      redirect_to :action => :show, :id => @story
    else
      render :edit
    end
  end
  
  def destroy
    Story.find(params[:id]).destroy
    redirect_to campaign_stories_path(current_campaign)
  end
  
  def story_params
    params.require(:story).permit(:location_id, :parent_id, campaign_object_attributes: campaign_object_attributes)
  end
  
end