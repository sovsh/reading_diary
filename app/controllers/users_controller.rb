class UsersController < ApplicationController
  before_action :authorize_user, only: %i[index show edit update destroy]

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_books_url(@current_user)
    else
      redirect_to users_new_path, alert: @user.errors.full_messages.join
    end
  end

  def new
    @user = User.new
  end

  def show

  end

  def edit

  end

  def update
    unless @current_user.authenticate(user_old_password[:old_password])
      return redirect_to edit_user_url(@current_user), alert: @current_user.errors.full_messages.join
    end
    @current_user.update(user_params)
    unless @current_user.valid?
      return redirect_to edit_user_url(@current_user), alert: @current_user.errors.full_messages.join
    end
    redirect_to user_url(@current_user)
  end

  def destroy
    @user.destroy
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user)
         .permit(:name, :email, :password, :password_confirmation)
  end

  def user_old_password
    params.require(:user)
          .permit(:old_password)
  end
end