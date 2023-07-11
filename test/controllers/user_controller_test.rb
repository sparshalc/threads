require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get discover" do
    get user_discover_url
    assert_response :success
  end
end
