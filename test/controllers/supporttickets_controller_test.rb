require "test_helper"

class SupportticketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @supportticket = supporttickets(:one)
  end

  test "should get index" do
    get supporttickets_url
    assert_response :success
  end

  test "should get new" do
    get new_supportticket_url
    assert_response :success
  end

  test "should create supportticket" do
    assert_difference('Supportticket.count') do
      post supporttickets_url, params: { supportticket: { closed_date: @supportticket.closed_date, description: @supportticket.description, open_date: @supportticket.open_date, status: @supportticket.status, title: @supportticket.title, user_id: @supportticket.user_id } }
    end

    assert_redirected_to supportticket_url(Supportticket.last)
  end

  test "should show supportticket" do
    get supportticket_url(@supportticket)
    assert_response :success
  end

  test "should get edit" do
    get edit_supportticket_url(@supportticket)
    assert_response :success
  end

  test "should update supportticket" do
    patch supportticket_url(@supportticket), params: { supportticket: { closed_date: @supportticket.closed_date, description: @supportticket.description, open_date: @supportticket.open_date, status: @supportticket.status, title: @supportticket.title, user_id: @supportticket.user_id } }
    assert_redirected_to supportticket_url(@supportticket)
  end

  test "should destroy supportticket" do
    assert_difference('Supportticket.count', -1) do
      delete supportticket_url(@supportticket)
    end

    assert_redirected_to supporttickets_url
  end
end
