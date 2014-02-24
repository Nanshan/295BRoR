require 'test_helper'

class AlertControllerTest < ActionController::TestCase
  test "should get userId" do
    get :userId
    assert_response :success
  end

  test "should get :string" do
    get ::string
    assert_response :success
  end

end
