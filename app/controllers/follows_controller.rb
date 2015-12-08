class FollowsController < ApplicationController

  def index
    @follows = Follow.all
    render :index
  end

  def create
    @follow = Follow.create(follow_params)
    if @follow.save

    else
      flash.now[:errors] = @follow.errors.full_messages
    end
    redirect_to user_url(@follow.follower_id)
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy
  end

  private

  def follow_params
    params.require(:follow).permit(:follower_id, :user_id)
  end

end
