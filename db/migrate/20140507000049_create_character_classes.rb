class CreateCharacterClasses < ActiveRecord::Migration
  def change
    create_table :character_classes do |t|
      t.references :character
      t.string :class_name
      t.integer :level
    end
    
    execute "INSERT INTO character_classes (character_id, class_name, level) SELECT character.id, character.character_class, character.level FROM characters as character"
    
    remove_columns :characters, :character_class, :level
  end
end
