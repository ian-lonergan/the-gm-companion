module CampaignObjectHolderController
  extend ActiveSupport::Concern
  
  def campaign_object_params
    params.require(:campaign_object).permit(:name, :abstract)
  end
  
  private
    def correct_user
      p params
      item = current_user.campaign_objects.find_by(campaign_object_holder_id: params[:id])
      item ||= current_user.campaigns.find_by(id: params[:campaign_id])
      if item.nil?
        flash[:error] = 'You don\'t have access to do this.'
        redirect_back_or :back
      end
    end
end