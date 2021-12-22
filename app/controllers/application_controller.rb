class ApplicationController < ActionController::Base
  before_action :set_current_user

  def authorise_user
    redirect_to auth_path unless @current_user
  end

  def set_current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def not_found
    render file: "#{Rails.root}/public/404.html"
  end
end
