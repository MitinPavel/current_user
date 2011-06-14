require 'helper'

class DashboardsTest < ActionController::IntegrationTest
  test 'something on the dashboard page' do
    get "/dashboard"
    assert_response :success
  end
end
