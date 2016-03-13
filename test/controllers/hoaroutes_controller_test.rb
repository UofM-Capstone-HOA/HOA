require 'test_helper'

class HoaroutesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
