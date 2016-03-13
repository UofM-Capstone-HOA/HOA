require 'test_helper'

class HomeOwnersControllerTest < ActionController::TestCase
  setup do
    @home_owner = home_owners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:home_owners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create home_owner" do
    assert_difference('home_owner.count') do
      post :create, home_owner: { email: @home_owner.email, firstName: @home_owner.firstname, lastName: @home_owner.lastname, phone: @home_owner.phone }
    end

    assert_redirected_to home_owner_path(assigns(:home_owner))
  end

  test "should show home_owner" do
    get :show, id: @home_owner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @home_owner
    assert_response :success
  end

  test "should update home_owner" do
    patch :update, id: @home_owner, home_owner: { email: @home_owner.email, firstName: @home_owner.firstname, lastName: @home_owner.lastname, phone: @home_owner.phone }
    assert_redirected_to home_owner_path(assigns(:home_owner))
  end

  test "should destroy home_owner" do
    assert_difference('home_owner.count', -1) do
      delete :destroy, id: @home_owner
    end

    assert_redirected_to home_owners_path
  end
end
