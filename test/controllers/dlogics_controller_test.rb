require 'test_helper'

class DlogicsControllerTest < ActionController::TestCase
  setup do
    @dlogic = dlogics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dlogics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dlogic" do
    assert_difference('Dlogic.count') do
      post :create, dlogic: { Event_1: @dlogic.Event_1, Event_2: @dlogic.Event_2, Event_3: @dlogic.Event_3, Event_4: @dlogic.Event_4, Event_5: @dlogic.Event_5, Event_6: @dlogic.Event_6, Then_do_these_things_1st: @dlogic.Then_do_these_things_1st, Then_do_these_things_2st: @dlogic.Then_do_these_things_2st, Then_do_these_things_3st: @dlogic.Then_do_these_things_3st, Then_do_these_things_4st: @dlogic.Then_do_these_things_4st, When_this_stuff_happens: @dlogic.When_this_stuff_happens }
    end

    assert_redirected_to dlogic_path(assigns(:dlogic))
  end

  test "should show dlogic" do
    get :show, id: @dlogic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dlogic
    assert_response :success
  end

  test "should update dlogic" do
    patch :update, id: @dlogic, dlogic: { Event_1: @dlogic.Event_1, Event_2: @dlogic.Event_2, Event_3: @dlogic.Event_3, Event_4: @dlogic.Event_4, Event_5: @dlogic.Event_5, Event_6: @dlogic.Event_6, Then_do_these_things_1st: @dlogic.Then_do_these_things_1st, Then_do_these_things_2st: @dlogic.Then_do_these_things_2st, Then_do_these_things_3st: @dlogic.Then_do_these_things_3st, Then_do_these_things_4st: @dlogic.Then_do_these_things_4st, When_this_stuff_happens: @dlogic.When_this_stuff_happens }
    assert_redirected_to dlogic_path(assigns(:dlogic))
  end

  test "should destroy dlogic" do
    assert_difference('Dlogic.count', -1) do
      delete :destroy, id: @dlogic
    end

    assert_redirected_to dlogics_path
  end
end
