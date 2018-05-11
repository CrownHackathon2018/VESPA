require 'test_helper'

class VikEnvsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vik_env = vik_envs(:one)
  end

  test "should get index" do
    get vik_envs_url
    assert_response :success
  end

  test "should get new" do
    get new_vik_env_url
    assert_response :success
  end

  test "should create vik_env" do
    assert_difference('VikEnv.count') do
      post vik_envs_url, params: { vik_env: { description: @vik_env.description, environment: @vik_env.environment } }
    end

    assert_redirected_to vik_env_url(VikEnv.last)
  end

  test "should show vik_env" do
    get vik_env_url(@vik_env)
    assert_response :success
  end

  test "should get edit" do
    get edit_vik_env_url(@vik_env)
    assert_response :success
  end

  test "should update vik_env" do
    patch vik_env_url(@vik_env), params: { vik_env: { description: @vik_env.description, environment: @vik_env.environment } }
    assert_redirected_to vik_env_url(@vik_env)
  end

  test "should destroy vik_env" do
    assert_difference('VikEnv.count', -1) do
      delete vik_env_url(@vik_env)
    end

    assert_redirected_to vik_envs_url
  end
end
