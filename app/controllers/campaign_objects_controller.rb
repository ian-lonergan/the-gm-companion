class CampaignObjectsController < ApplicationController
  def autocomplete_name
    type = params[:type]
    data = type.nil? \
      ? data = CampaignObject.by_campaign(current_campaign.id).where('LOWER(name) LIKE ?', "%#{params[:term].downcase}%").limit(5) \
      : data = CampaignObject.by_campaign(current_campaign.id).by_type(type).where('LOWER(name) LIKE ?', "%#{params[:term].downcase}%").limit(5)
    render json: data.map {|item| {label: item.name, id: item.id, campaign_object_holder_id: item.campaign_object_holder_id}}
  end
end