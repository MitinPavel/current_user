require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test "unauthorized user sees the 401 error page" do
    get "/my_protected_page"
    assert_response 401
    assert response.body.include?('Unauthorized'), 'Should contain unauthorized message'
  end

  test "successful login" do
    get '/current_user/keys/1234/sign_in'
  end

  test "an obscure key" do end
end

