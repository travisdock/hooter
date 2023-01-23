class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[ show update ]

  def show
  end

  def update
    if @user.update(user_params)
      redirect_to show_user_url(@user)
    else
      render :user_edit, status: :unprocessable_entity
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :bio, :username, :avatar)
    end
end
