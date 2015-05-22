require 'test_helper'

module Pig
  class ContentPackagesControllerTest < ActionController::TestCase
    setup do
      @content_package = content_packages(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:content_packages)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create content_package" do
      assert_difference('ContentPackage.count') do
        post :create, content_package: {  }
      end

      assert_redirected_to content_package_path(assigns(:content_package))
    end

    test "should show content_package" do
      get :show, id: @content_package
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @content_package
      assert_response :success
    end

    test "should update content_package" do
      patch :update, id: @content_package, content_package: {  }
      assert_redirected_to content_package_path(assigns(:content_package))
    end

    test "should destroy content_package" do
      assert_difference('ContentPackage.count', -1) do
        delete :destroy, id: @content_package
      end

      assert_redirected_to content_packages_path
    end
  end
end
