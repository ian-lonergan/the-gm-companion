class CharacterUpdate < ActiveRecord::Migration
  def change
    change_table :characters do |t|
      t.string :status
      t.string :alignment
    end
  end
end
