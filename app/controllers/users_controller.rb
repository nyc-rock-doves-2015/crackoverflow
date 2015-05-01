class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      session_in!(@user)
      redirect_to root_path
    else
      set_flash "Username taken, or passwords do not match!"
      redirect_to new_user_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end