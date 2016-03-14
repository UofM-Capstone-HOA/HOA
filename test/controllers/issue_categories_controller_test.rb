require 'test_helper'

class IssueCategoriesControllerTest < ActionController::TestCase
  setup do
    sign_in users(:one)
    @issue_category = issue_categories(:one)
  end

  test "should get index" do
    get :_index
    assert_response :success
    assert_not_nil assigns(:issue_categories)
  end

  test "should get new" do
    get :new
    assert_template layout: "issue_categories/new"
    # assert_response :success
  end

  test "should create issue_category" do
    assert_difference('@issue_category.count') do
      post :create, issue_category: { name: @issue_category.name }
    end
    assert_redirected_to issue_category_path(assigns(:issue_category))
  end

  test "should show issue_category" do
    get :show, id: @issue_category
    #assert_response :success
  end

  test "should get edit" do
    get :edit, id: @issue_category
    assert_response :success
  end

  test "should update issue_category" do
    patch :update, id: @issue_category, issue_category: { name: @issue_category.name }
    assert_redirected_to issue_category_path(assigns(:issue_category))
  end

  test "should destroy issue_category" do
    assert_difference('@issue_category.count', -1) do
      delete :destroy, id: @issue_category
    end
    
  assert_redirected_to issue_categories_path
  end

end
