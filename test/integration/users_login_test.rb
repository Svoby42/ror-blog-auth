require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:pepa)
  end

  test "login with valid information and log out" do
    get login_path
    post login_path, params: { session: { username: @user.username, password: 'password' } }
    assert is_logged_in?
    assert_redirected_to profile_path
    follow_redirect!
    assert_template "users/show"
    get logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
  end

  test "login with invalid information" do
    get login_path
    assert_template "sessions/new"
    post login_path, params: { session: { username: "nonexisten", password: "nonexisten" } }
    assert_redirected_to login_url
    assert_not flash.empty?
  end

end
