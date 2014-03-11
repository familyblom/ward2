class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||=  User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to root_path, alert: "NOT AUTHORIZED" if current_user.nil?
  end

  def authorize_admin
    unless current_user && current_user.is_admin?
      redirect_to root_path, alert: "NOT AUTHORIZED"
    end
  end
end
