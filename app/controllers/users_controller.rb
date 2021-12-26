class UsersController < ApplicationController
  before_action :authorize_user, only: %i[index show edit update destroy]

  def create
    @user = User.create(user_create_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_books_url(@current_user)
    else
      redirect_to new_user_path, alert: @user.errors.full_messages.join
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
    unless @current_user.authenticate(user_update_params[:old_password])
      return redirect_to edit_user_url(@current_user), alert: @current_user.errors.full_messages.join
    end
    unless user_params[:password].blank? || user_params[:password_confirmation].blank?
      @current_user.update_attribute(:password, user_params[:password])
    end
    unless User.where(:email => user_params[:email]).exists?
      @current_user.update_attribute(:email, user_update_params[:email])
    end
    @current_user.update_attribute(:name, user_update_params[:name])
    unless @current_user.valid?
      return redirect_to edit_user_url(@current_user), alert: @user.errors.full_messages.join
    end
    redirect_to user_url(@current_user)
  end

  def destroy
    @current_user.destroy
    redirect_to root_url
  end

  private

  def user_create_params
    params.require(:user)
         .permit(:name, :email, :password, :password_confirmation)
  end

  def user_update_params
    params.require(:user)
          .permit(:old_password, :name, :email, :password, :password_confirmation)
  end

  def user_old_password
    params.require(:user)
          .permit(:old_password)
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end
end