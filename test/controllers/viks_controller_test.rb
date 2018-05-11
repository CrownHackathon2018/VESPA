require 'test_helper'

class ViksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vik = viks(:one)
  end

  test "should get index" do
    get viks_url
    assert_response :success
  end

  test "should get new" do
    get new_vik_url
    assert_response :success
  end

  test "should create vik" do
    assert_difference('Vik.count') do
      post viks_url, params: { vik: { location: @vik.location, name: @vik.name } }
    end

    assert_redirected_to vik_url(Vik.last)
  end

  test "should show vik" do
    get vik_url(@vik)
    assert_response :success
  end

  test "should get edit" do
    get edit_vik_url(@vik)
    assert_response :success
  end

  test "should update vik" do
    patch vik_url(@vik), params: { vik: { location: @vik.location, name: @vik.name } }
    assert_redirected_to vik_url(@vik)
  end

  test "should destroy vik" do
    assert_difference('Vik.count', -1) do
      delete vik_url(@vik)
    end

    assert_redirected_to viks_url
  end
end
