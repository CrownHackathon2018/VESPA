require 'test_helper'

class PromEnvsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prom_env = prom_envs(:one)
  end

  test "should get index" do
    get prom_envs_url
    assert_response :success
  end

  test "should get new" do
    get new_prom_env_url
    assert_response :success
  end

  test "should create prom_env" do
    assert_difference('PromEnv.count') do
      post prom_envs_url, params: { prom_env: { description: @prom_env.description, environment: @prom_env.environment } }
    end

    assert_redirected_to prom_env_url(PromEnv.last)
  end

  test "should show prom_env" do
    get prom_env_url(@prom_env)
    assert_response :success
  end

  test "should get edit" do
    get edit_prom_env_url(@prom_env)
    assert_response :success
  end

  test "should update prom_env" do
    patch prom_env_url(@prom_env), params: { prom_env: { description: @prom_env.description, environment: @prom_env.environment } }
    assert_redirected_to prom_env_url(@prom_env)
  end

  test "should destroy prom_env" do
    assert_difference('PromEnv.count', -1) do
      delete prom_env_url(@prom_env)
    end

    assert_redirected_to prom_envs_url
  end
end
