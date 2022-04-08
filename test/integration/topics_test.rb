require "test_helper"

class TopicsTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:admin)
    @topic = topics(:udalosti)
  end

  test "topic form display" do
    log_in_as(@admin)
    get new_topic_path
    assert_template "topics/new"
  end
end
