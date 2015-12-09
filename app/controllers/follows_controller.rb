class FollowsController < ApplicationController

  def index
    if params["follows"] == 'followers'
      @followers_ids = []

      current_user.follows.each do |follow|
        @followers_ids << User.find(follow.follower_id).id
      end

      fail
      render :followers_index
    else
      @followings_ids = []

      @followings = Follow.where(follower_id: current_user.id)

      @followings.each do |following|
        @followings_ids << following.user_id
      end

      fail
      render :followings_index
    end
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
