class AddAgeToCharacters < ActiveRecord::Migration
  def change
    change_table :characters do |t|
      t.integer :age
    end
  end
end
