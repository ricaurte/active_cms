module ActiveCms
  class PagesController < ActiveCms::ApplicationController
    
    def show
      @page = Page.find_by_slug(params[:id])
      unless @page
        not_found
      end
    end
    
  end
end