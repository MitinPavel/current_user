Given /^a new rails application$/ do
  steps <<-STR
    When I run `cp -r ../../seed/aruba_dummy dummy`
    And I cd to "dummy"

    And I append to "Gemfile" with "gem 'current_user', :path => '../../..'"
    And I successfully run `bundle install`
  STR
end
