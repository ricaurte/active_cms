module ActiveCms
  module PagesHelper

    def get_pages_list(slug, include_self = true, self_as_link = false)
      page = ActiveCms::Page.where(:slug =>slug.to_s).first
      return "No page for '#{slug.to_s}' found." if !page || !page.children || page.children.size == 0
      
      ret = "<ul>"
      ret << "<li>"+((self_as_link)? "<a href=\"#{page.link}\">#{page.title}</a>+" : "#{page.title}") + "<ul>" if include_self
      page.children.each do |item|
        ret << "<li class=\"\"><a href=\"#{item.link}\">#{item.title}</a></li>"
      end
      ret << "</ul></li>" if include_self
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