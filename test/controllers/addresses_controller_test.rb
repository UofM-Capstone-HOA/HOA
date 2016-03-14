require 'test_helper'

# We dont have any of theses pages be accessed on their own 

class AddressesControllerTest < ActionController::TestCase
  setup do
    sign_in users(:one)
    @address = addresses(:one)
    :address
  end

  # test "should get index" do
  #   get :index
  #   assert_template layout: "layouts/application", partial: "_index" 
  #   # get "addresses"
  #   # assert_response :success
  #   # assert_not_nil assigns(:addresses)
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  test "should create address" do
    assert_difference('Address.count') do
      post :create, address: { city: "Memphis", home_owner_id: 1, number: 512, state: "TN", street: "Some Random Road" }
    end

    assert_redirected_to admin_path(users(:one).id) #address_path(assigns(:address))
  end

  # test "should show address" do
  #   get :show, id: @address
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @address
  #   assert_response :success
  # end

  test "should update address" do
    patch :update, id: @address, address: { city: @address.city, home_owner_id: @address.home_owner_id, number: @address.number, state: @address.state, street: @address.street }
    assert_redirected_to admin_path(users(:one).id)
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete :destroy, id: @address
    end

    assert_redirected_to admin_path(users(:one).id)
  end
end
