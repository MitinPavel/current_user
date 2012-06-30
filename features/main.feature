Feature: Current user generators
  In order to get an authentication solution in minutes and be happy
  As a developer
  I use CurrentUser's generators

  Background:
    When I successfully run `rails new dummy_app`
    And I cd to "dummy_app"

    And I append to "Gemfile" with "gem 'current_user', :path => '../../..'"
    And I successfully run `bundle install`
    Then the file "Gemfile.lock" should match /current_user/

  Scenario: Key generation
    Then a file named "config/current_user/key" should not exist
    When I successfully run `rails generate current_user:install`
    Then a file named "config/current_user/key" should exist
