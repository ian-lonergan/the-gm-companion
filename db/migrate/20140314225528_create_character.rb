class CreateCharacter < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string  :character_class
      t.string  :race
      t.integer :level
      t.string  :gender
      t.text    :description
    end
  end
end
