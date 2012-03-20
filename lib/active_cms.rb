require "active_cms/engine"
require "friendly_id"

module ActiveCms
  def self.setup
    yield self
  end
end
