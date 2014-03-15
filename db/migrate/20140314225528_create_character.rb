class CreateCharacter < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string  :class
      t.string  :race
      t.integer :level
      t.string  :gender
      t.text    :description
      t.references :campaign_object, polymorphic: true
      t.timestamps
    end
  end
end
