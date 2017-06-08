require 'test_helper'

class SwitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @swit = swits(:one)
  end

  test "should get index" do
    get swits_url
    assert_response :success
  end

  test "should get new" do
    get new_swit_url
    assert_response :success
  end

  test "should create swit" do
    assert_difference('Swit.count') do
      post swits_url, params: { swit: { post: @swit.post, sours_count: @swit.sours_count, sweets_count: @swit.sweets_count, user_id: @swit.user_id } }
    end

    assert_redirected_to swit_url(Swit.last)
  end

  test "should show swit" do
    get swit_url(@swit)
    assert_response :success
  end

  test "should get edit" do
    get edit_swit_url(@swit)
    assert_response :success
  end

  test "should update swit" do
    patch swit_url(@swit), params: { swit: { post: @swit.post, sours_count: @swit.sours_count, sweets_count: @swit.sweets_count, user_id: @swit.user_id } }
    assert_redirected_to swit_url(@swit)
  end

  test "should destroy swit" do
    assert_difference('Swit.count', -1) do
      delete swit_url(@swit)
    end

    assert_redirected_to swits_url
  end
end
