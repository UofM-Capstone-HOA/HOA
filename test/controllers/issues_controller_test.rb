require 'test_helper'

class IssuesControllerTest < ActionController::TestCase
  setup do
    sign_in users(:one)
    @issue = issues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  # We have some problems in the logic of the issue, address, and home_owner
  # this currently fails
  test "should create issue" do
    assert_difference('Issue.count') do
      post :create, issue: { date: DateTime.now, address_id: 2, user_id: 1, issue_category_id: 2, note: "a" }
    end
    assert_redirected_to issues_path()
  end

  # test "should show issue" do
  #   get :show, id: @issue.id
  #   assert partial :success
  # end

  test "should get edit" do
    get :edit, id: @issue
    assert_response :success
  end

  test "should update issue" do
    patch :update, id: @issue, issue: { date: DateTime.now, address_id: 1, user_id: 1, issue_category_id: 1 }
    assert_redirected_to issues_path()
  end

  test "should destroy issue" do
    assert_difference('Issue.count', -1) do
      delete :destroy, id: @issue
    end

    assert_redirected_to issues_path
  end
end
