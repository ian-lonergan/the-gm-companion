class CreateCampaignObject < ActiveRecord::Migration
  def change
    create_table :campaign_objects do |t|
      t.string :name
      t.string :abstract
      t.text   :notes
      t.timestamps
    end
  end
end
