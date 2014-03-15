class CreateCampaignObject < ActiveRecord::Migration
  def change
    create_table :campaign_objects do |t|
      t.string :name
      t.string :abstract
      t.text   :notes
      t.references :campaign_object_holder, polymorphic: true
      t.timestamps
    end
  end
end
