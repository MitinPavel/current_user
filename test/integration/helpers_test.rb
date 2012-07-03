require 'integration_test_helper'

class HelpersTest < ActionDispatch::IntegrationTest
  include ::CurrentUser::NavigationHelper

  fixtures :all

  test "#signed_in?" do
    visit '/signed_in_helper_page'
    assert page.has_content?("#signed_in? is false"),
           "User isn't signed in"

    sign_in

    visit '/signed_in_helper_page'
    assert page.has_content?("#signed_in? is true"),
           "User is signed in"
  end
end