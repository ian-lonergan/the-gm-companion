class AddLocationToStories < ActiveRecord::Migration
  def change
    change_table :stories do |t|
      t.references :location
    end
  end
end
