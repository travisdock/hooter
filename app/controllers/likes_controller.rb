class LikesController < ApplicationController
  def create
    @like = Like.new(hoot_id: params[:id], user_id: current_user.id)
    if @like.save
      flash[:success] = "You liked the hoot!"
      redirect_to hoots_path
    else
      flash[:error] = "You can't like the hoot!"
      redirect_to hoots_path
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
      flash[:success] = "You unliked the hoot!"
      redirect_to hoots_path
    else
      flash[:error] = "You can't unlike the hoot!"
      redirect_to hoots_path
    end
  end
end
