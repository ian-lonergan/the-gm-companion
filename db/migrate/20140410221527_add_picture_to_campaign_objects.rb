class AddPictureToCampaignObjects < ActiveRecord::Migration
  def change
    change_table :campaign_objects do |t|
      t.attachment :picture
    end
  end
end
