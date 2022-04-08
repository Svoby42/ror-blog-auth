module ApplicationHelper

  DATE_FORMAT = "%d. %m. %Y %H:%M"

  def full_title(page_title = '')
    base_title = "CRUD"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def created_at_time(article)
    article.created_at.strftime(DATE_FORMAT)
  end

end
