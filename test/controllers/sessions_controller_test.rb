require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_path
    assert_response :success
  end

  test "should get create" do
    get sessions_create_url
    assert_response :success
  end

  test "should get edit" do
    get sessions_edit_url
    assert_response :success
  end

  test "should get update" do
    get sessions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get logout_path
    assert_response :success
  end

end
