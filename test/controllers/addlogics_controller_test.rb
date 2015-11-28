require 'test_helper'

class AddlogicsControllerTest < ActionController::TestCase
  setup do
    @addlogic = addlogics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:addlogics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create addlogic" do
    assert_difference('Addlogic.count') do
      post :create, addlogic: { Event_1: @addlogic.Event_1, Event_2: @addlogic.Event_2, Event_3: @addlogic.Event_3, Event_4: @addlogic.Event_4, Event_5: @addlogic.Event_5, Event_6: @addlogic.Event_6, Then_do_these_things_1st: @addlogic.Then_do_these_things_1st, Then_do_these_things_2st: @addlogic.Then_do_these_things_2st, Then_do_these_things_3st: @addlogic.Then_do_these_things_3st, Then_do_these_things_4st: @addlogic.Then_do_these_things_4st, When_this_stuff_happens: @addlogic.When_this_stuff_happens }
    end

    assert_redirected_to addlogic_path(assigns(:addlogic))
  end

  test "should show addlogic" do
    get :show, id: @addlogic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @addlogic
    assert_response :success
  end

  test "should update addlogic" do
    patch :update, id: @addlogic, addlogic: { Event_1: @addlogic.Event_1, Event_2: @addlogic.Event_2, Event_3: @addlogic.Event_3, Event_4: @addlogic.Event_4, Event_5: @addlogic.Event_5, Event_6: @addlogic.Event_6, Then_do_these_things_1st: @addlogic.Then_do_these_things_1st, Then_do_these_things_2st: @addlogic.Then_do_these_things_2st, Then_do_these_things_3st: @addlogic.Then_do_these_things_3st, Then_do_these_things_4st: @addlogic.Then_do_these_things_4st, When_this_stuff_happens: @addlogic.When_this_stuff_happens }
    assert_redirected_to addlogic_path(assigns(:addlogic))
  end

  test "should destroy addlogic" do
    assert_difference('Addlogic.count', -1) do
      delete :destroy, id: @addlogic
    end

    assert_redirected_to addlogics_path
  end
end
