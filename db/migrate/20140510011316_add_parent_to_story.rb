class AddParentToStory < ActiveRecord::Migration
  def change
    change_table :stories do |t|
      t.references :parent
    end
  end
end
