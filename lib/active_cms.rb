require 'active_cms/engine'
require 'ckeditor'
require 'friendly_id'
require 'ancestry'

require 'rack/cache'
require 'dragonfly'

#override the standard from ckeditor
require File.dirname(__FILE__) + '/../../lib/active_cms/backend/dragonfly.rb'

module ActiveCms

  def self.setup
    yield self
  end
  
end