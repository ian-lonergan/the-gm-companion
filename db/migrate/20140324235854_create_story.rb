class CreateStory < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :story_text
    end
  end
end
