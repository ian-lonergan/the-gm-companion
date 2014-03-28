module SessionManagementHelper
  def choose_campaign(campaign)
    session[:campaign_id] = campaign ? campaign.id : nil
  end
  
  def current_campaign
    session[:campaign_id] ? Campaign.find(session[:campaign_id]) : nil
  end
  
  def current_campaign?
    !current_campaign.nil?
  end
end
