class StarItems < ActiveRecord::Migration
  def change
    create_table :starred do |t|
      t.references :user
      t.references :starred_item, polymorphic: true
    end
  end
end
