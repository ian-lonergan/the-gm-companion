class CreateLocation < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.attachment :map
      t.text :map_key
      t.references :campaign_object, polymorphic: true
    end
  end
end
