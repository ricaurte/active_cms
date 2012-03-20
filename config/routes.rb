ActiveCms::Engine.routes.draw do
  
  match '/:id.shtml', :to => 'active_cms/pages#show', :as => :page
  
end
