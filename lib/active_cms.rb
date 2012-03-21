require "active_cms/engine"
require "friendly_id"
require "ancestry"

module ActiveCms
  def self.setup
    yield self
  end
end
