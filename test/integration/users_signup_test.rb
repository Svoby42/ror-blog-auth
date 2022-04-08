require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "should register a user with valid information" do
    get signup_path
    assert_difference 'User.count' do
      post users_path, params: { user: { username: "pepekvyskoc",
                                         full_name: Faker::Name.first_name + " " + Faker::Name.last_name,
                                         email: "josef.vyskocil2@seznam.cz",
                                         password: "heslo123",
                                         password_confirmation: "heslo123",
                                         role: "ADMIN"} }
    end
    user = assigns(:user)
    assert user.role = "USER"
  end

end
