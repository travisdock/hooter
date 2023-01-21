class HootersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_hooter, only: %i[ show update ]

  def show
  end

  def update
    if @hooter.update(hooter_params)
      redirect_to hooter_url(@hooter)
    else
      render :user_edit, status: :unprocessable_entity
    end
  end

  private
    def set_hooter
      @hooter = User.find(params[:id])
    end

    def hooter_params
      params.require(:user).permit(:email, :bio, :username, :avatar)
    end
end
