require 'test_helper'

class SsrfControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ssrf_index_url
    assert_response :success
  end

end
