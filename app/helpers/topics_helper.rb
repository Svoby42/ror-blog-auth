module TopicsHelper

  def shorten(article)
    Loofah.fragment(article.article_content.to_plain_text).scrub!(:strip).text
  end

end
