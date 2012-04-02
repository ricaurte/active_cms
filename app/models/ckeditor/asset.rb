class Ckeditor::Asset < ActiveRecord::Base
  
  set_table_name 'active_cms_assets'
  
  include Ckeditor::Orm::ActiveRecord::AssetBase
  include ActiveCms::Backend::Dragonfly
  
  def data_file_name
    return data_uid
  end
  
end
