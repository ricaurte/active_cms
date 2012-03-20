module ActiveCms
  class ApplicationController < ::ApplicationController
    
    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end
    
  end
end
