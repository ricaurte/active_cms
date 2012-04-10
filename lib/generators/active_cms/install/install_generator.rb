module ActiveCms
  module Generators
    class InstallGenerator < Rails::Generators::NamedBase
      desc "Generats the necessary migrations for ActiveCms"

      include Rails::Generators::Migration
      
      def self.source_root
        File.expand_path("../templates", __FILE__)
      end
      
      def create_migrations
        p 'heloo'
        Dir["#{self.class.source_root}/../../../../db/migrate/*.rb"].sort.each do |filepath|
          p filepath
          name = File.basename(filepath)
          migration_template "migrations/#{name}", "db/migrate/#{name.gsub(/^\d+_/,'')}"
          sleep 1
        end
      end
      
    end
  end
end