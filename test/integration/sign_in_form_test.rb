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

  test 'link for each existing user' do
    User.create! :email => 'john.doe@example.com'
    do_request
    elements = css_select '#resources .resource'
    #TODO check elements
  end 

  test('meaningful message if there is no user') { pending }
  test('title') { pending }
end
