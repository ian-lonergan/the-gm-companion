class RemoveCampaignObjects < ActiveRecord::Migration
  def change
    tables = [:characters, :encounters, :locations, :organizations, :stories]
    
    tables.each do |table|
      change_table table do |t|
        t.references  :campaign
        t.string      :name
        t.string      :abstract
        t.text        :object_text
        t.attachment  :picture
        t.timestamps
      end
    end
    
    change_table :notes do |t|
      t.references :campaign_object_temp, polymorphic: true
    end
    
    columns = [:campaign_id, :name, :abstract, :object_text, :picture_file_name, :picture_content_type, :picture_file_size, :picture_updated_at, :created_at, :updated_at]
    
    tables.each do |table|
      update_sql = "UPDATE #{table.to_s} u SET"
      columns.each do |column|
        update_sql += " #{column.to_s} = s.#{column.to_s},"
      end
      update_sql = update_sql.chomp(',')
      update_sql += " FROM campaign_objects s WHERE (u.id = s.campaign_object_holder_id AND s.campaign_object_holder_type = '#{table.to_s.classify}')"
      execute update_sql
      
      execute "UPDATE notes n SET campaign_object_temp_id = s.id, campaign_object_temp_type = '#{table.to_s.classify}' FROM campaign_objects c, #{table.to_s} s WHERE n.campaign_object_id = c.id AND c.campaign_object_holder_id = s.id AND c.campaign_object_holder_type = '#{table.to_s.classify}'"
    end
    
    remove_columns :notes, :campaign_object_id
    rename_column :notes, :campaign_object_temp_id, :campaign_object_id
    rename_column :notes, :campaign_object_temp_type, :campaign_object_type
    
    drop_table :campaign_objects
  end
end
