require "test_helper"

class ShippingMethodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shipping_method = shipping_methods(:one)
  end

  test "should get index" do
    get shipping_methods_url, as: :json
    assert_response :success
  end

  test "should create shipping_method" do
    assert_difference("ShippingMethod.count") do
      post shipping_methods_url, params: { shipping_method: { name: @shipping_method.name, price: @shipping_method.price } }, as: :json
    end

    assert_response :created
  end

  test "should show shipping_method" do
    get shipping_method_url(@shipping_method), as: :json
    assert_response :success
  end

  test "should update shipping_method" do
    patch shipping_method_url(@shipping_method), params: { shipping_method: { name: @shipping_method.name, price: @shipping_method.price } }, as: :json
    assert_response :success
  end

  test "should destroy shipping_method" do
    assert_difference("ShippingMethod.count", -1) do
      delete shipping_method_url(@shipping_method), as: :json
    end

    assert_response :no_content
  end
end
