require 'mime/types'

module ActiveCms
  module Backend
    module Dragonfly
      def self.included(base)
        base.send(:include, InstanceMethods)
        base.send(:extend, ClassMethods)
      end
      
      module ClassMethods
        def self.extended(base)
          base.class_eval do
          end
        end
      end
      
      module InstanceMethods
        
        def url_content
          self.data.url
        end

        def url_thumb
          self.data.thumb('200x200').url
        end
        
        def width
          self.data_width
        end
        
        def height
          self.data_height
        end
        
        def data_file_name
          self.data_uid
        end
        
        def data_content_type
          self.data_type
        end
        
        def size
          self.data_size
        end
        
        def data_file_size
          self.data_size
        end
        
      end
    end
  end
end