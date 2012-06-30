require 'integration_test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "unauthorized user sees the 401 error page" do
    visit '/my_protected_page'
    assert page.has_content?('Unauthorized'), 'Contains "unauthorized" message'
    assert_equal 401, page.status_code, 'Responds with the unauthorized http status code'
  end

  test "repeated successful login process" do
    sign_in_path = '/current_user/keys/12345/sign_in/new'
    visit sign_in_path
    assert_equal 200, page.status_code, 'Responds with the OK http status code'
    page.click_link_or_button 'Login as admin@my.app.com'
    assert page.has_content?('Welcome admin@my.app.com'), 'Contains the welcome message for the first user'

    visit sign_in_path
    assert_equal 200, page.status_code, 'Responds with the OK http status code'
    page.click_link_or_button 'Login as member@some.app.com'
    assert page.has_content?('Welcome member@some.app.com'), 'Contains the welcome message for the second user'
  end

  test "an obscure key" do end
  test "all users in the application database are available to be login under" do end
  test "logout" do
    # login
    # check out you see a protected page
    # go to the login page one more time
    # try to return to the protected page
  end
end

