require 'integration_test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "unauthorized user sees the 401 error page" do
    visit '/my_protected_page'
    assert page.has_content?('Unauthorized'), 'Contains "unauthorized" message'
    assert_equal 401, page.status_code, 'Responds with the unauthorized http status code'
  end

  test "repeated successful login process" do
    visit sing_in_page_path
    assert_equal 200, page.status_code, 'Sign in responds with the OK http status code'
    page.click_button 'admin@my.app.com'
    assert_equal 200, page.status_code, 'Root responds with the OK http status code'
    assert page.has_content?('Welcome admin@my.app.com'), 'Contains the welcome message for the first user'

    visit sing_in_page_path
    assert_equal 200, page.status_code, 'Responds with the OK http status code'
    page.click_link_or_button 'member@some.app.com'
    assert page.has_content?('Welcome member@some.app.com'), 'Contains the welcome message for the second user'
  end

  test "invalide key" do
    invalid_key = '54321'
    visit sing_in_page_path(invalid_key)
    assert page.has_content?('Unauthorized'), 'Contains "unauthorized" message'
    assert_equal 401, page.status_code, 'Responds with the unauthorized http status code'
  end

  test "empty users table" do
    ::User.destroy_all

    visit sing_in_page_path

    assert page.has_content?("Your database doesn't contain users."),
           'Show a message about an empty user table'
  end

  test "all users in the application database are listed in the signin page" do end
  test "logout" do
    # login
    # check out you see a protected page
    # go to the login page one more time
    # try to return to the protected page
  end
  test "helper methods in views" do end

  private

  def sing_in_page_path(key = '12345')
    "/current_user/keys/#{key}/sign_in/new"
  end
end

