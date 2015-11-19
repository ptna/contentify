$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "contentify/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "contentify"
  s.version     = Contentify::VERSION
  s.authors     = ["igrs_ptna"]
  s.email       = ["igarashi@piano.or.jp"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Contentify."
  s.description = "TODO: Description of Contentify."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]
  ###########################
  # Rails
  ###########################
  s.add_dependency "rails", "~> 4.2.5"
  s.add_dependency "sass-rails", "~> 5.0"
  s.add_dependency "uglifier", ">= 1.3.0"
  s.add_dependency "coffee-rails", "~> 4.1.0"
  s.add_dependency "therubyracer"
  s.add_dependency "jquery-rails"
  s.add_dependency "turbolinks"
  s.add_dependency "jbuilder", "~> 2.0"
  s.add_dependency "mysql2"
  ###########################
  # Need to contentify
  ###########################
  s.add_dependency "sorcery"
  s.add_dependency "materialize-sass"
  s.add_dependency "kaminari"
  s.add_dependency "carrierwave"
  s.add_dependency "cocoon"
  s.add_dependency "active_hash"
  s.add_dependency "squeel"
  s.add_dependency "closure_tree"
end
