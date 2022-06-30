require 'test_helper'

class CommandInjControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get command_inj_index_url
    assert_response :success
  end

end
