module ActiveCms
  class Engine < ::Rails::Engine
    #isolate_namespace ActiveCms
    
    config.i18n.load_path += Dir[File.dirname(__FILE__) + '/../../config/locales/' + '*.{rb,yml}']
    
    # load admin-module
    config.after_initialize do
      require File.dirname(__FILE__) + '/../../config/initializers/active_admin.rb'
      require File.dirname(__FILE__) + '/../../config/initializers/active_cms.rb'
      
      require File.dirname(__FILE__) + '/../../config/initializers/ckeditor.rb'
      require File.dirname(__FILE__) + '/../../app/admin/pages.rb'
      # include dragonfly for file-handling
      #require 'dragonfly/rails/images'
    end
    
    # load helper
    initializer 'active_cms.helper' do |app|
      ActionView::Base.send :include, PagesHelper
    end
    
  end
end