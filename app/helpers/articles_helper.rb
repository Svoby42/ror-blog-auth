module ArticlesHelper

  DATE_FORMAT = "%d. %m. %Y %H:%M"

  def created_at_time(article)
    article.created_at.strftime(DATE_FORMAT)
  end

end
