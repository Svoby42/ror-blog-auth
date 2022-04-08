require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: "pepekvyskocil",
                     full_name: "Josef Vyskočil",
                     email: "pepek.vyskocil@seznam.cz",
                     password: "heslo123",
                     password_confirmation: "heslo123")
    @topic = topics(:udalosti)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "email should be lowercase" do
    email = "OmEgAlUl@sEzNaM.cZ"
    @user.email = email
    @user.save
    assert_equal email.downcase, @user.reload.email
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
end
