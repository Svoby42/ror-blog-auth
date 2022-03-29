require "test_helper"

class ArticleTest < ActiveSupport::TestCase

  def setup
    @user = users(:pepa)
    @topic = topics(:udalosti)
    @article = Article.new(title: "Článek", article_content: "prvni clanek", slug: "clanek", user_id: @user.id, topic_id: @topic.id)
  end

  test "should be valid" do
    assert @article.valid?
  end

  test "user id should be present" do
    @article.user_id = nil
    assert_not @article.valid?
  end

  test "topic id should be present" do
    @article.topic_id = nil
    assert_not @article.valid?
  end

  test "content should be present" do
    @article.article_content = " "
    assert_not @article.valid?
  end

end
