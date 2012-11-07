require 'test_helper'

class LineItemControllerTest < ActionController::TestCase
  test "should get price" do
    get :price
    assert_response :success
  end

  test "should get product" do
    get :product
    assert_response :success
  end

  test "should get quantity" do
    get :quantity
    assert_response :success
  end

  test "should get cart_id" do
    get :cart_id
    assert_response :success
  end

end
