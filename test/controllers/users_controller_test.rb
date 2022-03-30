require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:pepa)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { username: @user.username, email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should not allow the role attribute to be edited via the web" do
    log_in_as(@user)
    assert_not @user.role == "ADMIN"
    patch user_path(@user), params: { user: { password: "heslo123", password_confirmation: "heslo123", role: "ADMIN" } }
    assert_not @user.role == "ADMIN"
  end

end
