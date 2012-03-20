module ActiveCms
  class Page < ActiveRecord::Base
    
    self.table_name = 'active_cms_pages'
    
    extend FriendlyId
    friendly_id :title, :use => :slugged
    
    
  end
end