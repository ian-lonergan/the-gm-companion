class CreateNotes < ActiveRecord::Migration
  def change
    remove_column :campaign_objects, :notes
    create_table :notes do |t|
      t.string :text
      t.references :campaign_object
      t.timestamps
    end
  end
end
