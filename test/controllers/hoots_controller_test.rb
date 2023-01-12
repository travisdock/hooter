require "test_helper"

class HootsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hoot = hoots(:one)
  end

  test "should get index" do
    get hoots_url
    assert_response :success
  end

  test "should get new" do
    get new_hoot_url
    assert_response :success
  end

  test "should create hoot" do
    assert_difference("Hoot.count") do
      post hoots_url, params: { hoot: { body: @hoot.body, user_id: @hoot.user_id } }
    end

    assert_redirected_to hoot_url(Hoot.last)
  end

  test "should show hoot" do
    get hoot_url(@hoot)
    assert_response :success
  end

  test "should get edit" do
    get edit_hoot_url(@hoot)
    assert_response :success
  end

  test "should update hoot" do
    patch hoot_url(@hoot), params: { hoot: { body: @hoot.body, user_id: @hoot.user_id } }
    assert_redirected_to hoot_url(@hoot)
  end

  test "should destroy hoot" do
    assert_difference("Hoot.count", -1) do
      delete hoot_url(@hoot)
    end

    assert_redirected_to hoots_url
  end
end
