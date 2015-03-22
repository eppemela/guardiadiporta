require 'test_helper'

class StationsControllerTest < ActionController::TestCase
  setup do
    @station = stations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stations)
  end

  test "should create station" do
    assert_difference('Station.count') do
      post :create, station: { name: @station.name }
    end

    assert_response 201
  end

  test "should show station" do
    get :show, id: @station
    assert_response :success
  end

  test "should update station" do
    put :update, id: @station, station: { name: @station.name }
    assert_response 204
  end

  test "should destroy station" do
    assert_difference('Station.count', -1) do
      delete :destroy, id: @station
    end

    assert_response 204
  end
end
