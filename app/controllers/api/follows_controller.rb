class Api::FollowsController < Api::ApiController

  def index
    @follows = Follow.all

    render :index
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
