module ActiveCms
  module PagesHelper

    def get_pages_list(slug, options = {})
      
      # variables
      exclude_self  ||= options[:exclude_self]  # should the current page be included ad first item? default: yes
      no_link       ||= options[:no_link]       # should the current page be linked? default: yes
      no_links      ||= options[:no_links]      # should the subpages be linked? default: yes
      
      page = ActiveCms::Page.where(:slug =>slug.to_s).first
      return "No page for '#{slug.to_s}' found." if !page 
      return "No pages in '#{slug.to_s}' found." if !page.children || page.children.size == 0
      
      ret = "<ul class=\"#{page.slug}\">"
      ret << "<li>"+((!no_link)? "<a href=\"#{page.link}\">#{page.title}</a>" : "#{page.title}") + "<ul>" unless exclude_self
      page.children.where(:menu => true).each do |item|
        ret << "<li class=\"#{item.slug}\"><a href=\"#{item.link}\">#{item.title}</a></li>" unless no_links
        ret << "<li class=\"#{item.slug}\">#{item.title}</li>" if no_links
      end
      ret << "</ul></li>" unless exclude_self
      ret << "</ul>"
      raw(ret)
    end
    
    def page_path_for(page)
      if page.new_record?
        admin_active_cms_pages_path(page).gsub('.', '')
      else
        admin_active_cms_page_path(page)
      end
    end
  end
end