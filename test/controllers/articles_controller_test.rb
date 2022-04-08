require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @article = articles(:first)
    @owner = users(:pepa)
    @other_user = users(:alois)
  end

  test "should destroy if correct user" do
    log_in_as(@owner)
    assert_difference 'Article.count', -1 do
      get delete_topic_article_path(@article.topic.slug, @article.slug)
    end
  end

  test "should edit if correct user" do
    log_in_as(@owner)
    get edit_topic_article_path(@article.topic.slug, @article.slug)
    assert_template "articles/edit"
  end

  test "should redirect destroy if wrong user" do
    log_in_as(@other_user)
    assert_no_difference 'Article.count' do
      get delete_topic_article_path(@article.topic.id, @article.id)
    end
    assert_not flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect edit if wrong user" do
    log_in_as(@other_user)
    get edit_topic_article_path(@article.topic.slug, @article.slug)
    assert_redirected_to root_url
  end

end
