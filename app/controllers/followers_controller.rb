class FollowersController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:id])
    current_user.follows.create(followed_id: @user.id)
    redirect_to show_user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    current_user.follows.find_by(followed_id: @user.id).destroy
    redirect_to show_user_path(@user)
  end
end
