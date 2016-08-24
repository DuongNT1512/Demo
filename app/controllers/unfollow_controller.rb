class UnfollowController < ApplicationController
  before_action :logged_in_user

  def destroy
    @user = User.find_by id: params[:id]
    if current_user.following? @user
      current_user.unfollow @user
      @user = current_user.active_relationships.build
    end
    redirect_to @user
  end

end
