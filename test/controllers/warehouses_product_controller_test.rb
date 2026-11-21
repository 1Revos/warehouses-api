require "test_helper"

class WarehousesProductControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get warehouses_product_index_url
    assert_response :success
  end

  test "should get create" do
    get warehouses_product_create_url
    assert_response :success
  end

  test "should get update" do
    get warehouses_product_update_url
    assert_response :success
  end

  test "should get destroy" do
    get warehouses_product_destroy_url
    assert_response :success
  end
end
