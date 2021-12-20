class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      #redirect_to 'users/show' #redirect to the right path
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

  end

  def destroy

  end

  private

  def user_params
    params.require(:user)
         .permit(:name, :email, :password, :password_confirmation)
  end
end