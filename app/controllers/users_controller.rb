class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :show, :create]
  before_action :find_user, except: [:new, :index, :create]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def new
    @gender = User.genders.keys
    @user = User.new
  end

  def index
    @users = User.paginate page: params[:page]
  end

  def show
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      remember @user
      flash[:success] = "Welcome to the Duong's Demo App!"
      redirect_to @user
    else
      @gender = User.genders.keys
      render :new
    end
  end

  def edit
    @genders = User.genders.keys
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      @gender = User.genders.keys
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation, :gender
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in!"
      redirect_to login_url
    end
  end

  def correct_user
    redirect_to root_url unless @user.current_user? current_user
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def find_user
    @user = User.find_by id: params[:id]
  end
end
