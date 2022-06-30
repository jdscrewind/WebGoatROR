require 'test_helper'

class CsrfControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get csrf_index_url
    assert_response :success
  end

end
