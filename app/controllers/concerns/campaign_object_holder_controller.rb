module CampaignObjectHolderController
  extend ActiveSupport::Concern
    
  def campaign_object_attributes
    [:id, :name, :abstract, :campaign_id, :picture, :object_text]
  end
  
  private
    def campaign_set_from_campaign_object(campaign_object_type)
      campaign_object = campaign_object_type.find(params[:id])
      campaign = campaign_object.campaign
      if campaign.nil?
        flash[:error] = 'Unable to properly set the campaign'
        redirect_back_or :back
      else
        choose_campaign(campaign) if current_campaign != campaign
      end
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
  
    def correct_campaign_object_owner(campaign_object_type)
      p campaign_object_type.joins(campaign: :owner).where(owner_id: current_user.id).to_sql
      campaign_object = campaign_object_type.joins(campaign: :owner).where("campaigns.owner_id = #{current_user.id}").find(params[:id])
      if campaign_object.nil?
        flash[:error] = 'You don\'t have access to do this.'
        redirect_back_or :back
      end
    end
    
    def correct_campaign_owner
      campaign = current_user.campaigns.find_by(id: params[:campaign_id])
      if campaign.nil?
        flash[:error] = 'You don\'t have access to do this.'
        redirect_back_or :back
      end
    end
end