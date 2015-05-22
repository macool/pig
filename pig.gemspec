$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pig/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pig"
  s.version     = Pig::VERSION
  s.authors     = ["Yoomee Developers"]
  s.email       = ["developers@yoomee.com"]
  s.homepage    = "http://yoomee.com"
  s.summary     = "The Yoomee CMS"
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0"

  s.add_development_dependency "sqlite3"
end
