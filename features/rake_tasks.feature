Feature: Current user rake tasks
  In order to solve some problems automatically
  As a developer
  I use CurrentUser's rake tasks

#  Background:
#    Given a new rails application
#    When I successfully run `rails generate current_user:install`
#
#  Scenario: "current_user:sign_in_path" task
#    Given a file named "config/current_user/key" with:
#      """
#      42
#      """
#    When I successfully run `rake current_user:sign_in_path`
#    Then the output should contain "/current_user/42/sign_in"