module ActiveCms
  class Page < ActiveRecord::Base
    
    self.table_name = 'active_cms_pages'
    
    extend FriendlyId
    friendly_id :title, :use => :slugged
    
    has_ancestry
    
    # returne extern link to page
    def link
      self.redirect unless self.redirect.nil?
      ('/'+self.slug).gsub('//', '/')
    end
    
    def self.tree(ignore=nil)
      ancestry_options(ActiveCms::Page.scoped.arrange(:order => 'title'), ignore) { |i| 
        "#{'-' * i.depth} #{i.title}" 
      }
    end

    def self.ancestry_options(items, ignore)
      result = []
      items.map do |item, sub_items|
        result << [yield(item), item.id] unless item.id == ignore
        result += ancestry_options(sub_items, ignore) { |i| 
          "#{'-' * i.depth} #{i.title}" 
        }
      end
      result
    end
    
  end
end