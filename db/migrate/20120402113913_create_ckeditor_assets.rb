class CreateCkeditorAssets < ActiveRecord::Migration
  def self.up
    create_table :active_cms_assets do |t|
      
      t.string  :data_file_name#, :null => false
      t.string  :data_uid, :null => false
      
      t.string  :data_type
      t.integer :data_size
      
      t.integer :assetable_id
		  t.string  :assetable_type, :limit => 30
      t.string  :type, :limit => 30

      # Uncomment	it to save images dimensions, if your need it
      t.integer :data_width
      t.integer :data_height

      t.timestamps
    end
    
    add_index "active_cms_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"
		add_index "active_cms_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  end

  def self.down
    drop_table :ckeditor_assets
  end
end