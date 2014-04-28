class OrganizationsController < ApplicationController
  include CampaignObjectHolderController
  before_action :campaign_set_from_campaign_object, only: [:show, :edit, :update, :destroy]
  before_action :campaign_set_from_campaign_id, only: [:index, :create, :new]
  before_action :logged_in_user, only: [:new, :create, :update, :edit, :destroy]
  before_action :correct_campaign_object_owner, only: [:update, :edit, :destroy]
  before_action :correct_campaign_owner, only: [:new, :create]

  def index
    @organizations = Campaign.find(params[:campaign_id]).organizations.paginate(per_page: 10, page: params[:page])
  end
  
  def new
    @organization = Organization.new
    @organization.build_campaign_object
    @organization.campaign = Campaign.find(params[:campaign_id])
  end
  
  def create
    @organization = Organization.new(organization_params)
    @organization.campaign = Campaign.find(params[:campaign_id])
    if @organization.save
      redirect_to :action => :show, :id => @organization
    else
      render :new
    end
  end
  
  def show
    @organization = Organization.includes(:campaign_object).find(params[:id])
  end
  
  def edit
    @organization = Organization.includes(:campaign_object).find(params[:id])
  end
  
  def update
    @organization = Organization.find(params[:id])
    if @organization.update_attributes(organization_params)
      redirect_to :action => :show, :id => @organization
    else
      render :edit
    end
  end
  
  def destroy
    Organization.find(params[:id]).destroy
    redirect_to campaign_organizations_path(current_campaign)
  end
  
  def organization_params
    params.require(:organization).permit(campaign_object_attributes: campaign_object_attributes, organization_members_attributes: organization_members_attributes)
  end
  
  def organization_members_attributes
    [:id, :character_id, :_destroy]
  end
  
end
