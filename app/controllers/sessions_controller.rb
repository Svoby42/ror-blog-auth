class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user&.authenticate(params[:session][:password])
      reset_session
      log_in user
      redirect_to profile_path
    else
      redirect_to login_path
      flash[:danger] = "Špatné údaje"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
