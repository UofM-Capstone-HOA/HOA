require 'test_helper'

class AddressesControllerTest < ActionController::TestCase
  setup do
    @address = addresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create address" do
    assert_difference('address.count') do
      post :create, address: { city: @address.city, home_owner_id: @address.home_owner_id, number: @address.number, state: @address.state, street: @address.street }
    end

    assert_redirected_to address_path(assigns(:address))
  end

  test "should show address" do
    get :show, id: @address
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @address
    assert_response :success
  end

  test "should update address" do
    patch :update, id: @address, address: { city: @address.city, home_owner_id: @address.home_owner_id, number: @address.number, state: @address.state, street: @address.street }
    assert_redirected_to address_path(assigns(:address))
  end

  test "should destroy address" do
    assert_difference('address.count', -1) do
      delete :destroy, id: @address
    end

    assert_redirected_to addresses_path
  end
end
