$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_cms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "active_cms"
  s.version     = ActiveCms::VERSION
  s.authors     = ["geisters: Frank Cieslik"]
  s.email       = ["cieslik@geisters.de"]
  s.homepage    = "geisters.de/fraank"
  s.summary     = "A Basic-CMS-Plugin based on the great active_admin-Interface."
  s.description = "TODO: Description of ActiveCms."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2.0"
  s.add_dependency "activeadmin", ">= 0.4.0"
  s.add_dependency "kaminari"
  s.add_dependency "friendly_id"
  
  s.add_dependency "ckeditor", "3.7.0.rc3"
  
  s.add_development_dependency "sqlite3"
end
