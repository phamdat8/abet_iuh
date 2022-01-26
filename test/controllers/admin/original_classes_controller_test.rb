require 'test_helper'

class Admin::OriginalClassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_original_class = admin_original_classes(:one)
  end

  test "should get index" do
    get admin_original_classes_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_original_class_url
    assert_response :success
  end

  test "should create admin_original_class" do
    assert_difference('Admin::OriginalClass.count') do
      post admin_original_classes_url, params: { admin_original_class: { code: @admin_original_class.code, name: @admin_original_class.name } }
    end

    assert_redirected_to admin_original_class_url(Admin::OriginalClass.last)
  end

  test "should show admin_original_class" do
    get admin_original_class_url(@admin_original_class)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_original_class_url(@admin_original_class)
    assert_response :success
  end

  test "should update admin_original_class" do
    patch admin_original_class_url(@admin_original_class), params: { admin_original_class: { code: @admin_original_class.code, name: @admin_original_class.name } }
    assert_redirected_to admin_original_class_url(@admin_original_class)
  end

  test "should destroy admin_original_class" do
    assert_difference('Admin::OriginalClass.count', -1) do
      delete admin_original_class_url(@admin_original_class)
    end

    assert_redirected_to admin_original_classes_url
  end
end
