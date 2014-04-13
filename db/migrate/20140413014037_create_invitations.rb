class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :key
      t.references :user
    end
  end
end
