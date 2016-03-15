require 'test_helper'

class HomeOwnersControllerTest < ActionController::TestCase
  setup do
    sign_in users(:one)
    @home_owner = home_owners(:one)
  end

  # test "should get index" do
  
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:home_owners)
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  test "should create home_owner" do
    assert_difference('HomeOwner.count') do
      post :create, home_owner: { email: @home_owner.email, firstname: @home_owner.firstname, lastname: @home_owner.lastname, phone: @home_owner.phone }
    end

    assert_redirected_to admin_path(users(:one))
  end

  # test "should show home_owner" do
  #   get :show, id: @home_owner.id
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @home_owner.id
  #   assert_response :success
  # end

  test "should update home_owner" do
    patch :update, id: @home_owner.id, home_owner: { email: @home_owner.email, firstName: @home_owner.firstname, lastName: @home_owner.lastname, phone: @home_owner.phone }
    assert_redirected_to admin_path(users(:one))
  end

  test "should destroy home_owner" do
    assert_difference('HomeOwner.count', -1) do
      delete :destroy, id: @home_owner.id
    end

    assert_redirected_to admin_path(users(:one))
  end
end
