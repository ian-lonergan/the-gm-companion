module CampaignObjectHolderController
  extend ActiveSupport::Concern
  
  def campaign_object_params
    params.require(:campaign_object).permit(:name, :abstract, :notes)
  end
end