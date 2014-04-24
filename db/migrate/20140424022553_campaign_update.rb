class CampaignUpdate < ActiveRecord::Migration
  def change
    change_table :campaigns do |t|
      t.text :campaign_text
    end
    
    Campaign.find_each do |campaign|
      campaign.campaign_text = "#{campaign.description}\n#{campaign.outline}"
      campaign.save
    end
    
    remove_columns :campaigns, :description, :outline
  end
end
