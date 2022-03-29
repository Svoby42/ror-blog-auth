require "test_helper"

class TopicTest < ActiveSupport::TestCase

  def setup
    @topic = Topic.new(title: "prvni topic",
                       description: "proste topic",
                       slug: "prvni-topic")
  end

  test "should be valid" do
    assert @topic.valid?
  end

  test "title should be present" do
    @topic.title = ""
    assert_not @topic.valid?
  end

  test "description should be present" do
    @topic.description = ""
    assert_not @topic.valid?
  end

  test "slug should be present" do
    @topic.slug = ""
    assert_not @topic.valid?
  end

  test "slug should be in correct format" do
    @topic.slug = "bezel pes pres oves"
    assert_not @topic.valid?
  end

  test "title should be unique" do
    duplicate = @topic.dup
    @topic.save
    assert_not duplicate.valid?
  end

end
