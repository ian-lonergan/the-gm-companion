class CreateEncountersCharacters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.integer     :challenge_level
      t.references  :location
      t.text        :loot
      t.text        :description
    end
    create_table :encounters_characters, id: false do |t|
      t.integer :encounter_id
      t.integer :character_id
      t.integer :count
    end
  end
end
