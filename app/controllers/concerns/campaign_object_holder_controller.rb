module CampaignObjectHolderController
  extend ActiveSupport::Concern
  
  def campaign_object_params
    params.require(:campaign_object).permit(:name, :abstract)
  end
  
  private
    def correct_user
      @campaign_object = current_user.campaign_objects.find_by(campaign_object_holder_id: params[:id])
      if @campaign_object.nil?
        flash[:error] = 'You don\'t have access to do this.'
        redirect_back_or :back
      end
    end
end