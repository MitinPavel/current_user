require 'integration_test_helper'

class HelpersTest < ActionDispatch::IntegrationTest
  include ::CurrentUser::NavigationHelper

  fixtures :all

  test "#signed_in?" do
    visit '/helpers/signed_in_helper'
    assert page.has_content?("#signed_in? is false"),
           "User isn't signed in"

    sign_in

    visit '/helpers/signed_in_helper'
    assert page.has_content?("#signed_in? is true"),
           "User is signed in"
  end

  test "#current_user" do
    visit '/helpers/current_user_helper'
    assert page.has_content?("#current_user is nil"),
           "Current user is nil"

    sign_in

    visit '/helpers/current_user_helper'
    assert page.has_content?("#current_user is member@some.app.com"),
           "User is signed in"
  end
end