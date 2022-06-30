require 'test_helper'

class XssControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get xss_index_url
    assert_response :success
  end

end
