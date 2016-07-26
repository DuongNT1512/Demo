class UsersController < ApplicationController

  def new
    @gender = User.genders.keys
    @user = User.new
  end

  def show
    @user = User.find_by id: params[:id]
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      remember user
      flash[:success] = "Welcome to the Duong's Demo App!"
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation, :gender
  end

end
