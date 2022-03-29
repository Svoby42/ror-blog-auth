module UsersHelper

  DATE_FORMAT = "%d. %m. %Y %H:%M"

  def admin_user
    redirect_to(root_url) unless is_admin?(current_user)
  end

  def is_admin?(user)
    user.role == "ADMIN"
  end

  def registered_at_time(user)
    user.created_at.strftime(DATE_FORMAT)
  end

  def last_login_time(user)
    user.last_login.present? ? user.last_login.strftime(DATE_FORMAT) : "nikdy"
  end

end
