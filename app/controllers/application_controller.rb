class ApplicationController < ActionController::Base
  include SessionsHelper
  include UsersHelper

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Prosím, přihlašte se"
        redirect_to login_url
      end
    end

  def record_not_found
    redirect_to not_found_url
  end

end
