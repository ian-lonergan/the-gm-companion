class CreateStory < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :story_text
      t.references :campaign_object, polymorphic: true
    end
  end
end
