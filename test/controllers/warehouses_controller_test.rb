require "test_helper"

class WarehousesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get warehouses_index_url
    assert_response :success
  end

  test "should get show" do
    get warehouses_show_url
    assert_response :success
  end

  test "should get create" do
    get warehouses_create_url
    assert_response :success
  end

  test "should get update" do
    get warehouses_update_url
    assert_response :success
  end

  test "should get destroy" do
    get warehouses_destroy_url
    assert_response :success
  end
end
