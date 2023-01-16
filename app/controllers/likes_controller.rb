class LikesController < ApplicationController
  def create
    @like = Like.new(like_params.merge(user_id: current_user.id))
    if @like.save
      flash[:success] = "You liked the hoot!"
      redirect_to hoot_path(@like.hoot_id)
    else
      flash[:error] = "You can't like the hoot!"
      redirect_to hoot_path(@like.hoot_id)
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
      flash[:success] = "You unliked the hoot!"
      redirect_to hoot_path(@like.hoot_id)
    else
      flash[:error] = "You can't unlike the hoot!"
      redirect_to hoot_path(@like.hoot_id)
    end
  end

  private

  def like_params
    params.require(:like).permit(:hoot_id)
  end
end
