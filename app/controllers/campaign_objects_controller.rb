class CampaignObjectsController < ApplicationController
  before_action :campaign_set_from_campaign_id, only: [:index]
  
  helper_method :sort_column
  
  def index
    @campaign_objects = Campaign.find(params[:campaign_id]).campaign_objects.order(sort_column).paginate(per_page: 25, page: params[:page])
  end
  
  def tags
    @campaign_objects = Campaign.find(params[:campaign_id]).campaign_objects.tagged_with(params[:tag]).order(sort_column).paginate(per_page: 25, page: params[:page])
    render :index
  end
  
  def autocomplete_name
    type = params[:type]
    data = type.nil? \
      ? data = CampaignObject.by_campaign(current_campaign.id).where('LOWER(name) LIKE ?', "%#{params[:term].downcase}%").limit(5) \
      : data = CampaignObject.by_campaign(current_campaign.id).by_type(type).where('LOWER(name) LIKE ?', "%#{params[:term].downcase}%").limit(5)
    render json: data.map {|item| {label: item.name, id: item.id, campaign_object_holder_id: item.campaign_object_holder_id}}
  end
  
  private
    def sort_column
      CampaignObject.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end
    
     def campaign_set_from_campaign_id
      campaign = Campaign.find_by(id: params[:campaign_id])
      if campaign.nil?
        flash[:error] = 'Unable to properly set the campaign'
        redirect_back_or :back
      else
        choose_campaign(campaign) if current_campaign != campaign
      end
    end
end