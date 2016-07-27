class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by email: params[:email]
    if user && !user.activate && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:sucess] = "Account activate"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to user
    end
  end
end
