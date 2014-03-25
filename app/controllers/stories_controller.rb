class StoriesController < ApplicationController
  include CampaignObjectHolderController

  def index
    @stories = Story.all
  end
  
  def new
    @campaign_object = CampaignObject.new
    @story = Story.new
  end
  
  def create
    @story = Story.create(story_params)
    @story.campaign_object = CampaignObject.create(campaign_object_params)
    @story.save
    redirect_to :action => :show, :id => @story
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
    @deleted = Story.find(params[:id]).destroy
    redirect_to :action => :index
  end
  
  def story_params
    params.require(:story).permit(:story_text)
  end
  
end
