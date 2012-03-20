require "active_cms/engine"

module ActiveCms
  def self.setup
    yield self
  end
end
