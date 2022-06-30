require 'test_helper'

class SqlInjControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sql_inj_index_url
    assert_response :success
  end

end
