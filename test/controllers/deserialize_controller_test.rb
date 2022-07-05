require 'test_helper'

class DeserializeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get deserialize_index_url
    assert_response :success
  end

end
