class DbUpdate < ActiveRecord::Migration
  def change
    change_table :campaign_objects do |t|
      t.text :object_text
    end
    
    Character.find_each do |character|
      character.campaign_object.object_text = character.description
      character.campaign_object.save
    end
    
    Encounter.find_each do |encounter|
      encounter.campaign_object.object_text = encounter.description
      encounter.campaign_object.save
    end
    
    Organization.find_each do |organization|
      organization.campaign_object.object_text = organization.organization_text
      organization.campaign_object.save
    end
    
    Story.find_each do |story|
      story.campaign_object.object_text = story.story_text
      story.campaign_object.save
    end
    
    remove_column :characters, :description
    remove_columns :encounters, :description, :loot
    remove_columns :organizations, :summary, :organization_text
    remove_column :stories, :story_text
  end
end
