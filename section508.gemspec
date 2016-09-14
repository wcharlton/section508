$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "section508/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "section508"
  s.version     = Section508::VERSION
  s.authors     = ["William Charlton"]
  s.email       = ["william.j.charlton@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Section508."
  s.description = "TODO: Description of Section508."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.7.1"

  s.add_development_dependency "sqlite3"
end
