class CreateEncounterOpponents < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.integer     :challenge_level
      t.references  :location
      t.text        :loot
      t.text        :description
    end
    create_table :encounter_opponents do |t|
      t.references :encounter
      t.references :character
      t.integer :count
    end
  end
end
