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
    User.create! :email => 'jill@example.com'

    visit sign_in_path
    select 'john.doe@example.com', :from => 'Email'
    click_on 'Sign in' 

    assert page.has_content?('Welcome john.doe@example.com'), "Sign in is successful"
  end

  test('meaningful message if there is no user') { pending }
  test('title') { pending }
end
