module ActiveCms
  class PagesController < ActiveCms::ApplicationController
    
    def show
      
      @page = Page.find_by_slug(params[:id])
      unless @page
        not_found
      else
        @title = @page.title
        @meta_keywords = @page.meta_keywords || 'meta'
        @meta_description = @page.meta_description || 'meta'
      end
    end
    
  end
end