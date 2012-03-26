module ActiveCms
  class Page < ActiveRecord::Base
    
    self.table_name = 'active_cms_pages'
    
    extend FriendlyId
    friendly_id :make_slug, :use => :slugged
    
    has_ancestry
    
    def make_slug
      (!self[:slug] || self[:slug].nil? || self[:slug] == "")? title : self[:slug]
    end
    
    # return extern link to page
    def link
      self.redirect unless self.redirect.nil?
      ('/'+self.slug).gsub('//', '/')+'.shtml'
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