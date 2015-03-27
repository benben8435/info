require 'test_helper'

class DinningsControllerTest < ActionController::TestCase
  setup do
    @dinning = dinnings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dinnings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dinning" do
    assert_difference('Dinning.count') do
      post :create, dinning: { price: @dinning.price, quantity: @dinning.quantity, rate: @dinning.rate, user_id: @dinning.user_id }
    end

    assert_redirected_to dinning_path(assigns(:dinning))
  end

  test "should show dinning" do
    get :show, id: @dinning
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dinning
    assert_response :success
  end

  test "should update dinning" do
    patch :update, id: @dinning, dinning: { price: @dinning.price, quantity: @dinning.quantity, rate: @dinning.rate, user_id: @dinning.user_id }
    assert_redirected_to dinning_path(assigns(:dinning))
  end

  test "should destroy dinning" do
    assert_difference('Dinning.count', -1) do
      delete :destroy, id: @dinning
    end

    assert_redirected_to dinnings_path
  end
end
