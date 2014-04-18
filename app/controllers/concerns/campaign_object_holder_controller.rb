module CampaignObjectHolderController
  extend ActiveSupport::Concern
  
  def campaign_object_params
    params.require(:campaign_object).permit(:name, :abstract, :campaign_id, :picture)
  end
  
  def campaign_object_attributes
    [:name, :abstract, :campaign_id, :picture]
  end
  
  private
    def campaign_set
      campaign_object = CampaignObject.find_by(campaign_object_holder_id: params[:id])
      campaign = campaign_object.campaign unless campaign_object.nil?
      campaign ||= Campaign.find_by(id: params[:campaign_id])
      if campaign.nil?
        flash[:error] = 'Unable to properly set the campaign'
        redirect_back_or :back
      else
        choose_campaign(campaign) if current_campaign != campaign
      end
    end
  
    def correct_campaign_object_owner
      item = current_user.campaign_objects.find_by(campaign_object_holder_id: params[:id])
      if item.nil?
        flash[:error] = 'You don\'t have access to do this.'
        redirect_back_or :back
      end
    end
    
    def correct_campaign_owner
      item = current_user.campaigns.find_by(id: params[:campaign_id])
      if item.nil?
        flash[:error] = 'You don\'t have access to do this.'
        redirect_back_or :back
      end
    end
end