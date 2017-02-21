require 'test_helper'

class ObjsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @obj = objs(:one)
  end

  test "should get index" do
    get objs_url
    assert_response :success
  end

  test "should get new" do
    get new_obj_url
    assert_response :success
  end

  test "should create obj" do
    assert_difference('Obj.count') do
      post objs_url, params: { obj: { desc: @obj.desc, name: @obj.name } }
    end

    assert_redirected_to obj_url(Obj.last)
  end

  test "should show obj" do
    get obj_url(@obj)
    assert_response :success
  end

  test "should get edit" do
    get edit_obj_url(@obj)
    assert_response :success
  end

  test "should update obj" do
    patch obj_url(@obj), params: { obj: { desc: @obj.desc, name: @obj.name } }
    assert_redirected_to obj_url(@obj)
  end

  test "should destroy obj" do
    assert_difference('Obj.count', -1) do
      delete obj_url(@obj)
    end

    assert_redirected_to objs_url
  end
end
