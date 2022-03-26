module UsersHelper

  def is_admin?(user)
    user.role == "ADMIN"
  end

end
