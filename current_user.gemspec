$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "current_user/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "current_user"
  s.version     = CurrentUser::VERSION
  s.authors     = ["Pavel Mitin"]
  s.email       = ["mitin.pavel@gmail.com"]
  s.homepage    = "https://github.com/MitinPavel/current_user"
  s.summary     = "Dev phase auth for Rails"
  s.description = <<-STR
An authentication gem for the pre-production (mainly) phase of the application lifecycle.
Provide a simple sign in page with a list of all users in the application.
Click on any user logins you to the application under the user.
  STR

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.extra_rdoc_files = ["README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2", "< 5"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'aruba'
end
