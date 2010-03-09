require 'test_helper'

class AttendersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attenders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attender" do
    assert_difference('Attender.count') do
      post :create, :attender => { }
    end

    assert_redirected_to attender_path(assigns(:attender))
  end

  test "should show attender" do
    get :show, :id => attenders(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => attenders(:one).to_param
    assert_response :success
  end

  test "should update attender" do
    put :update, :id => attenders(:one).to_param, :attender => { }
    assert_redirected_to attender_path(assigns(:attender))
  end

  test "should destroy attender" do
    assert_difference('Attender.count', -1) do
      delete :destroy, :id => attenders(:one).to_param
    end

    assert_redirected_to attenders_path
  end
end
