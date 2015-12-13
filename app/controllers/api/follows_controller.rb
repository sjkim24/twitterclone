class Api::FollowsController < Api::ApiController

  def index
    @follows = Follow.all
    # @user_id = params[:user_id].to_i
    #
    # if params["follows"] == 'followers'
    #   @follower_users = []
    #   @followers = Follow.where(user_id: @user_id)
    #   @followers.each do |follower|
    #     @follower_users << User.find(follower.follower_id)
    #   end
    #
    #   render :followers_index
    # else
    #   @following_users = []
    #   @followings = Follow.where(follower_id: @user_id)
    #   @followings.each do |following|
    #     @following_users << User.find(following.user_id)
    #   end
    #
    #   render :followings_index
    # end
  end

  def create
    @follow = Follow.create(follow_params)
    render json: @follow
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follower_id = @follow.user_id
    @follow.destroy!
    render json: @follow
  end

  private

  def follow_params
    params.require(:follow).permit(:follower_id, :user_id)
  end

end
