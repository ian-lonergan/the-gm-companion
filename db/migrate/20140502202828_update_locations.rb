class UpdateLocations < ActiveRecord::Migration
  def change
    change_table :locations do |t|
      t.references :parent
    end
    change_table :characters do |t|
      t.references :location
    end
  end
end
