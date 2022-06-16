require "test_helper"

class Public::CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_carts_index_url
    assert_response :success
  end

  test "should get update" do
    get public_carts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_carts_destroy_url
    assert_response :success
  end

  test "should get create" do
    get public_carts_create_url
    assert_response :success
  end
end
