require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:pepa)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    assert is_logged_in?
    get edit_profile_path(@user)
    assert_template "users/edit"
    patch update_profile_path(@user), params: { user: { full_name: "jozin", email: "z@bazin.cz", password: "martin123" } }
    assert_redirected_to profile_path
    assert flash[:danger]
    assert_not flash[:success]
    follow_redirect!
    assert_template "users/show"
  end
end
