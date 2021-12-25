class AuthController < ApplicationController
  def create
    @user = User.find_by_email(user_params[:email])
    if @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to user_books_url(@user)
    else
      redirect_to new_auth_url, alert: @user.errors.full_messages.join
    end
  end

  def new
    @user = User.new
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user)
          .permit(:email, :password)
  end
end
