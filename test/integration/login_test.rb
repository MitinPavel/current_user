require 'integration_test_helper'

class LoginTest < ActionDispatch::IntegrationTest
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

  test "helper methods in views" do end
  test "all users in the application database are listed in the signin page" do end

  private

  def sing_in_page_path(key = '12345')
    "/current_user/#{key}/sign_in"
  end

  def assert_user_sees_unauthorized_error
    assert page.has_content?('Unauthorized'), 'Contains "unauthorized" message'
    assert_equal 401, page.status_code, 'Responds with the unauthorized http status code'
  end

  def assert_user_sees_protected_page(identifier)
    assert_equal 200, page.status_code, 'Root responds with the OK http status code'
    assert page.has_content?("Welcome #{identifier}"), 'Contains the welcome message for the use'
  end

  def sign_in_as(identifier)
    visit sing_in_page_path
    assert_equal 200, page.status_code, 'Sign in responds with the OK http status code'
    page.click_button identifier
    assert_user_sees_protected_page identifier
  end
end

