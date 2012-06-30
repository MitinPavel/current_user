$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "current_user/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "current_user"
  s.version     = CurrentUser::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of CurrentUser."
  s.description = "TODO: Description of CurrentUser."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.6"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'database_cleaner'
end
