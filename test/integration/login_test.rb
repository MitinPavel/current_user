require 'integration_test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  include ::CurrentUser::NavigationHelper

  fixtures :all

  test "unauthorized user sees the 401 error page" do
    visit '/my_protected_page'
    assert_user_sees_unauthorized_error
  end

  test "repeated successful login process" do
    sign_in_as 'admin@my.app.com'
    sign_in_as 'member@some.app.com'
  end

  test "sign in page does sign out" do
    sign_in_as 'member@some.app.com'
    visit sing_in_page_path
    visit '/my_protected_page'
    assert_user_sees_unauthorized_error
  end

  test "stored location" do
    visit '/my_another_protected_page'
    assert_user_sees_unauthorized_error
    sign_in
    assert page.has_content?("My another protected page"), 'Redirects to the stored location'
  end

  test "invalide key" do
    invalid_key = '54321'
    visit sing_in_page_path(invalid_key)
    assert_user_sees_unauthorized_error
  end

  test "empty users table" do
    ::User.destroy_all

    visit sing_in_page_path

    assert page.has_content?("Your database doesn't contain users."),
           'Show a message about an empty user table'
  end

  test "logout" do
    sign_in_as "member@some.app.com"
    visit 'current_user/sign_out'

    visit '/my_protected_page'
    assert_user_sees_unauthorized_error
  end

  test "all users in the application database are listed in the signin page" do end
end

