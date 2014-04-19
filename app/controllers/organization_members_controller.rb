class OrganizationMembersController < ApplicationController
  def autocomplete_character_name
    data = CampaignObject.by_campaign(current_campaign.id).by_type('Character').where('LOWER(name) LIKE ?', "%#{params[:term].downcase}%").limit(5)
    render json: data.map {|item| {label: item.name, id: item.id, campaign_object_holder_id: item.campaign_object_holder_id}}
  end
end