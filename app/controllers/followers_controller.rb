class FollowersController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:id])
    current_user.follows.create(followed_id: @user.id)
    redirect_to user_path(@user)
  end
end
