module ActiveCms
  class Engine < ::Rails::Engine
    #isolate_namespace ActiveCms
    
    # load admin-module
    config.after_initialize do
      require File.dirname(__FILE__) + '/../../config/initializers/active_cms.rb'
      require File.dirname(__FILE__) + '/../../app/admin/pages.rb'
    end
    
    # load helper
    initializer 'active_cms.helper' do |app|
      ActionView::Base.send :include, PagesHelper
    end
    
  end
end
