require 'helper'

class SignInFormTest < ActionController::IntegrationTest
  def do_request
    get "/users/sign_in"
  end

  test 'the response status is success' do
    do_request
    assert_response :success
  end

  test 'meaningful heading' do
    do_request
    assert_select 'h2', 'Sign in'
  end

  test 'title' do
    pending
  end
end
