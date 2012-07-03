module CurrentUser
  module NavigationHelper
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

    def sign_in
      sign_in_as 'member@some.app.com'
    end

    def sign_in_as(identifier)
      visit sing_in_page_path
      assert_equal 200, page.status_code, 'Sign in responds with the OK http status code'
      page.click_button identifier
      assert_user_sees_protected_page identifier
    end
  end
end