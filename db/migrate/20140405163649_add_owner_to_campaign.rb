class AddOwnerToCampaign < ActiveRecord::Migration
  def change
    change_table :campaigns do |t|
      t.belongs_to :owner
    end
  end
end
