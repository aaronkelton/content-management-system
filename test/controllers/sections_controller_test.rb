require 'test_helper'

class SectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sections_new_url
    assert_response :success
  end

  test "should get create" do
    get sections_create_url
    assert_response :success
  end

  test "should get index" do
    get sections_index_url
    assert_response :success
  end

  test "should get show" do
    get sections_show_url
    assert_response :success
  end

  test "should get edit" do
    get sections_edit_url
    assert_response :success
  end

  test "should get update" do
    get sections_update_url
    assert_response :success
  end

  test "should get delete" do
    get sections_delete_url
    assert_response :success
  end

  test "should get destroy" do
    get sections_destroy_url
    assert_response :success
  end

end
