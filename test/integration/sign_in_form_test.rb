require 'helper'

class SignInFormTest < ActionController::IntegrationTest
  include Capybara::DSL

  def sign_in_path
    '/users/sign_in'
  end

  test 'meaningful heading' do
    visit sign_in_path
    assert page.has_selector?('h2', :text => 'Sign in'), "Heading is ok"
  end

  test 'successful sign in' do
    User.create! :email => 'john.doe@example.com'

    visit sign_in_path
    select 'john.doe@examle.com', :from => 'Email'
  end

#
#  test 'the response status is success' do
#    do_request
#    assert_response :success
#  end
#
#  test 'meaningful heading' do
#    do_request assert_select 'h2', 'Sign in'
#  end
#
#  test 'link for each existing user' do
#    User.create! :email => 'john.doe@example.com'
#    do_request
#    elements = css_select '#resources .resource'
#    #TODO check elements
#  end 
#
  test('meaningful message if there is no user') { pending }
  test('title') { pending }
end
