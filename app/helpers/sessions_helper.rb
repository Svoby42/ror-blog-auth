module SessionsHelper

  @user = nil

  def log_in(user)
    session[:user_id] = user.id
    user = User.find_by(id: user.id)
    user.update(last_login: DateTime.now)
  end

  def current_user
    if(user_id = session[:user_id])
      @user ||= User.find_by(id: user_id)
    end
  end

  def current_user?(user)
    user == current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    reset_session
    @current_user = nil
  end
end
