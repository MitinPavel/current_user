require 'integration_test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "unauthorized user sees the 401 error page" do
    visit '/my_protected_page'
    assert page.has_content?('Unauthorized'), 'Should contain unauthorized message'
    assert_equal page.status_code, 401, 'Should respond with the unauthorized http status code'
  end

  test "successful login" do
    visit '/current_user/keys/12345/sign_in/new'
    assert_equal page.status_code, 200, 'Should respond with the OK http status code'

    page.click_link_or_button 'Login as admin@my.app.com'
    page.click_link 'admin@my.app.com'
    assert page.has_content?('Welcome admin@my.app.com')
  end

  test "an obscure key" do end
end

