require 'active_cms/engine'
require 'ckeditor'
require 'friendly_id'
require 'ancestry'

require 'rack/cache'
#require 'dragonfly'

#override the standard from ckeditor
#require 'active_cms/backend/dragonfly'

module ActiveCms

  def self.setup
    yield self
  end
  
end

