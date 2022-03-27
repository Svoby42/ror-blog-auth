require "test_helper"

class ArticleTest < ActiveSupport::TestCase

  def setup
    @user = users(:pepa)
    @article = Article.new(title: "Článek", content: "prvni clanek", slug: "clanek", user_id: @user.id)
  end

  test "should be valid" do
    assert @article.valid?
  end

  test "user id should be present" do
    @article.user_id = nil
    assert_not @article.valid?
  end

  test "content should be present" do
    @article.content = " "
    assert_not @article.valid?
  end

  test "content should be at least 5 chars long" do
    @article.content = "a" * 4
    assert_not @article.valid?
  end

end
