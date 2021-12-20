class ApplicationController < ActionController::Base

  def authorise_user
    redirect_to auth_path unless @current_user
  end

  def set_current_user
    @current_user ||= User.find_by_id session[:user_id]
  end

end
