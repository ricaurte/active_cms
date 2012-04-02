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
      require 'dragonfly/rails/images'
      
      #override the standard from ckeditor
      require File.dirname(__FILE__) + '/../../lib/active_cms/backend/dragonfly.rb'
      # require File.dirname(__FILE__) + '/../../app/controllers/ckeditor/pictures_controller.rb'
      # require File.dirname(__FILE__) + '/../../app/controllers/ckeditor/attachment_files_controller.rb'
      
    end
    
    # load helper
    initializer 'active_cms.helper' do |app|
      ActionView::Base.send :include, PagesHelper
    end
    
  end
end
