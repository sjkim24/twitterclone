class FollowsController < ApplicationController

  def index
    @follows = Follow.all
    render :index
  end

  def create
    @follow = Follow.create(follow_params)
    redirect_to user_url(@follow.user_id)
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follower_id = @follow.user_id
    @follow.destroy!
    redirect_to user_url(@follower_id)
  end

  private

  def follow_params
    params.require(:follow).permit(:follower_id, :user_id)
  end

end
