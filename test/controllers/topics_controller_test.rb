require "test_helper"

class TopicsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:admin)
    @not_admin = users(:pepa)
    @topic = topics(:udalosti)
  end

  test "should create a new topic if admin" do
    log_in_as(@admin)
    @new_topic = Topic.new(title: "novy titulek", description: "nazdar", slug: "novy-titulek" )
    assert_difference 'Topic.count' do
      @new_topic.save
    end
  end

  test "should update topic if admin" do
    log_in_as(@admin)
    assert_not @topic.nil?
    patch topic_path(@topic), params: { topic: { title: "novy titulek", description: "nazdar", slug: "novy-titulek" } }
    assert_redirected_to topics_path
  end

  test "should redirect new when not admin" do
    log_in_as(@not_admin)
    get new_topic_path
    assert_redirected_to root_path
  end

end
