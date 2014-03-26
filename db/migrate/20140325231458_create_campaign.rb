class CreateCampaign < ActiveRecord::Migration
  def change
    change_table :campaign_objects do |t|
      t.references :campaign
    end
    create_table :campaigns do |t|
      t.string :name
      t.text :description
      t.text :outline
      t.timestamps
    end
  end
end
