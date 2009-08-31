require 'test_helper'

class AlumniProfilesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alumni_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alumni_profile" do
    assert_difference('AlumniProfile.count') do
      post :create, :alumni_profile => { }
    end

    assert_redirected_to alumni_profile_path(assigns(:alumni_profile))
  end

  test "should show alumni_profile" do
    get :show, :id => alumni_profiles(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => alumni_profiles(:one).to_param
    assert_response :success
  end

  test "should update alumni_profile" do
    put :update, :id => alumni_profiles(:one).to_param, :alumni_profile => { }
    assert_redirected_to alumni_profile_path(assigns(:alumni_profile))
  end

  test "should destroy alumni_profile" do
    assert_difference('AlumniProfile.count', -1) do
      delete :destroy, :id => alumni_profiles(:one).to_param
    end

    assert_redirected_to alumni_profiles_path
  end
end
