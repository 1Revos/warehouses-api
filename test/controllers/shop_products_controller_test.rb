require "test_helper"

class ShopProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shop_products_index_url
    assert_response :success
  end

  test "should get create" do
    get shop_products_create_url
    assert_response :success
  end

  test "should get update" do
    get shop_products_update_url
    assert_response :success
  end

  test "should get destroy" do
    get shop_products_destroy_url
    assert_response :success
  end
end
