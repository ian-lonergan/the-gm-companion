class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.text :summary
      t.text :organization_text
    end
    create_table :organization_members do |t|
      t.references :organization
      t.references :character
    end
  end
end
