require "test_helper"

class UsersShowTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:pepa)
  end

  test "see users page as logged in" do
    get user_path(@user)
    assert_template "users/show"
  end

end
