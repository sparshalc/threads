require "test_helper"

class RecentControllerTest < ActionDispatch::IntegrationTest
  test "should get post" do
    get recent_post_url
    assert_response :success
  end
end
