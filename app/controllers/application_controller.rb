class ApplicationController < ActionController::Base
  include SessionsHelper
  include UsersHelper

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from AbstractController::ActionNotFound, with: :record_not_found
  rescue_from ActionController::RoutingError, with: :record_not_found
  rescue_from NoMethodError, with: :no_authorization

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

    def no_authorization
      flash[:danger] = "Musíte se přihlásit"
      redirect_to login_url
    end

end
