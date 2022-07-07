require 'test_helper'

class XxeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get xxe_index_url
    assert_response :success
  end

end
