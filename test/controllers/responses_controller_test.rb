require "test_helper"

class ResponsesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get responses_create_url
    assert_response :success
  end

  test "should get destroy" do
    get responses_destroy_url
    assert_response :success
  end
end
